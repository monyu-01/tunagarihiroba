class Public::NotificationsController < ApplicationController
  before_action :restrict_to_member!
  before_action :restrict_guest_member
  before_action :check_user_status

  def index
    base_scope = current_member.passive_notifications.joins(:visitor).merge(Member.available)
    @notifications = base_scope.includes(:visitor, :post, :comment).page(params[:page]).per(15)
    
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end    
  end
end
