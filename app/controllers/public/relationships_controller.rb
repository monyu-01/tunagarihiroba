class Public::RelationshipsController < ApplicationController
  before_action :authenticate_member!
  before_action :restrict_guest_member

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