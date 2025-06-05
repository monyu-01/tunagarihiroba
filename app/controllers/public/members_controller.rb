class Public::MembersController < ApplicationController
  def show
  end

  def dashboard
  end

  def edit_profile
    @member = current_member
  end

  def update_profile
    @member = current_member
    if @member.update(profile_params)
      redirect_to member_path(@member), notice: 'プロフィールを更新しました。'
    else
      render :edit_profile
    end
  end

  def saved_posts
  end

  def followers
  end

  def followings
  end

  def edit_information
    @member = current_member
  end

  def update_information #ここは調べて変更する
    @member = current_member
    unless @member.update_with_password(information_params)
      @current_password_required = information_params[:current_password].blank?
      render :edit_information
    else
      redirect_to dashboard_path, notice: "登録情報を更新しました。"
    end
  end

  def unsubscribe
  end

  private

  def profile_params
    params.require(:member).permit(:name, :introduction)
  end

  def information_params
    params.require(:member).permit(:email, :password, :current_password)
  end

end
