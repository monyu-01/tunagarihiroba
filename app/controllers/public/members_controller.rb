class Public::MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @post = Post.find(params[:id])
    @posts = @member.posts
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

  def saved_posts
  end

  def followers
  end

  def followings
  end

  private

  def profile_params
    params.require(:member).permit(:name, :self_introduction)
  end

end
