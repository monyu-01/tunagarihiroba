class ApplicationController < ActionController::Base

  protected

  def authenticate_member!
    unless member_signed_in?
      redirect_to new_member_session_path, alert: 'メールアドレスとパスワードの入力が必要です'
    end
  end

  def restrict_to_admin!
    unless admin_signed_in?
      redirect_to root_path
    end
  end

  def restrict_guest_member
    if current_member&.guest?
      redirect_to posts_path, notice: '申し訳ありません。ゲストモードではこの機能はご利用いただけません。'
    end
  end

  def check_user_status
    if current_member&.suspended?
      sign_out current_member
      redirect_to new_member_session_path, alert: "アカウントは停止されています。"
    end
  end
end
