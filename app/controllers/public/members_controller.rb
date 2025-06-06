class Public::MembersController < ApplicationController
  def show
    #@member = Member.find(params[:id])
    #@post = @member.post  
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

  private

  def profile_params
    params.require(:member).permit(:name, :introduction)
  end

end
