class ApplicationController < ActionController::Base

  protected

  def ensure_guest_member
    if current_member&.guest?
      redirect_to posts_path, notice: '申し訳ありません。ゲストモードではこの機能はご利用いただけません。'
    end
  end
end
