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
    if @member.update(member_params)
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
  end

  def unsubscribe
  end

  private

  def member_params
    params.require(:member).permit(:name, :introduction)
  end
end
