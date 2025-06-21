class Public::NotificationsController < ApplicationController
  def index
    @notifications = current_member.passive_notifications.includes(:visitor, :post, :comment).page(params[:page]).per(15)
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end    
  end
end
