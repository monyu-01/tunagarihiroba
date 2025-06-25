class Public::NotificationsController < ApplicationController
  before_action :authenticate_member!
  before_action :restrict_guest_member
  before_action :check_user_status

  def index
    @notifications = current_member.passive_notifications.includes(:visitor, :post, :comment).page(params[:page]).per(15)
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end    
  end
end
