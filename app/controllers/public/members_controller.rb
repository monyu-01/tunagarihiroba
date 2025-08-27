class Public::MembersController < ApplicationController
  before_action :restrict_to_member!
  before_action :restrict_guest_member
  before_action :set_member, only: [:show, :followings, :followers]
  before_action :check_user_status

  def show
    @posts = @member.posts.order(created_at: :desc).page(params[:page])
  end

  def edit_profile
    @member = current_member
  end

  def update_profile
    @member = current_member
    @member.assign_attributes(profile_params)
    if @member.valid?(:update_profile)
      @member.save
      redirect_to member_path(@member), notice: "プロフィールを更新しました。"
    else
      render :edit_profile
    end
  end

  def withdraw
    current_member.update(user_status: :suspended)
    reset_session
    redirect_to root_path, notice: "退会処理が完了しました。ご利用ありがとうございました。"
  end

  def saved_posts
    # ページ分のPostを取得（在籍メンバーに限定）
    base_scope = current_member.saved_posts_posts
                               .joins(:member)                 # 在籍フィルタ用の結合
                               .merge(Member.available)
                               .order('saved_posts.created_at DESC')

    @saved_posts = base_scope.page(params[:page])

    # N+1一掃：結果集合に対して必要な関連を明示プリロード
    # Active Recordの関連付けを効率的に事前読み込みするためのクラス
    ActiveRecord::Associations::Preloader.new.preload(
      @saved_posts,
      [
        :genre,                                            # Post -> Genre
        { image_attachment: { blob: :variant_records } },  # Post -> image
        { member: { profile_image_attachment: :blob } }    # Post -> Member -> profile_image
      ]
    )
  end

  def followings
    @followings = @member.followings.only_available_with_avatar.page(params[:page]).per(15)
  end

  def followers
    @followers = @member.followers.only_available_with_avatar.page(params[:page]).per(15)
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def profile_params
    params.require(:member).permit(:name, :self_introduction, :profile_image)
  end
end
