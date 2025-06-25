class Public::MembersController < ApplicationController
  before_action :authenticate_member!
  before_action :restrict_guest_member
  before_action :check_user_status


  def show
    @member = Member.find(params[:id])
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

  def saved_posts
    @saved_posts = current_member.saved_posts_posts.page(params[:page])
  end

  def followings
    member = Member.find(params[:id])
    @followings = member.followings.page(params[:page]).per(15)
  end

  def followers
    mamber = Member.find(params[:id])
    @followers = mamber.followers.page(params[:page]).per(15)
  end

  private

  def profile_params
    params.require(:member).permit(:name, :self_introduction, :profile_image)
  end
end
