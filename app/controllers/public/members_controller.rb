class Public::MembersController < ApplicationController
  before_action :restrict_to_member!
  before_action :restrict_guest_member
  before_action :set_member, only: [:show, :followings, :followers]
  before_action :check_user_status

  def show
    @posts = @member.posts.page(params[:page])
  end


  def edit_profile
    @member = current_member
  end

  def update_profile
    @member = current_member
    @member.assign_attributes(profile_params)
    if @member.valid?(:update_profile)
      @member.save
      redirect_to member_path(@member)
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
    base_scope = current_member.saved_posts_posts.joins(:member).merge(Member.available)
    @saved_posts = base_scope.order('saved_posts.created_at DESC').page(params[:page])
  end

  def followings
    @followings = @member.followings.merge(Member.available).page(params[:page]).per(15)
  end

  def followers
    @followers = @member.followers.merge(Member.available).page(params[:page]).per(15)
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def profile_params
    params.require(:member).permit(:name, :self_introduction, :profile_image)
  end
end
