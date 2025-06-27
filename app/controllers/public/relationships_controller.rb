class Public::RelationshipsController < ApplicationController
  before_action :restrict_to_member!
  before_action :restrict_guest_member
  before_action :check_user_status

  def create
    @member =  Member.find(params[:member_id])
    current_member.follow(@member)
    @member.create_notification_follow!(current_member)
  end

  def destroy
    @member = Member.find(params[:member_id])
    current_member.unfollow(@member)
  end
end