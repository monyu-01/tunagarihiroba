class Public::RelationshipsController < ApplicationController
  before_action :authenticate_member!
  def create
    member =  Member.find(params[:member_id])
    current_member.follow(member)
    member.create_notification_follow!(current_member)
    redirect_to member_path(member)
  end

  def destroy
    member = Member.find(params[:member_id])
    current_member.unfollow(member)
    redirect_to member_path(member)
  end
end