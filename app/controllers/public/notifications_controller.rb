class Public::NotificationsController < ApplicationController
  before_action :restrict_to_member!
  before_action :restrict_guest_member
  before_action :check_user_status

  def index
    # 非アクティブ含めて既読処理
    current_member.passive_notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end 

    # 表示はアクティブユーザーからのみに限定
    base_scope = current_member.passive_notifications.joins(:visitor).merge(Member.available).order(created_at: :desc)
    @notifications = base_scope.includes(:visitor, :post, :comment).page(params[:page]).per(15) 
  end
end
