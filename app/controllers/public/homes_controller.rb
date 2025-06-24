class Public::HomesController < ApplicationController
  def top
    if member_signed_in?
      redirect_to member_path(current_member)
    elsif admin_signed_in?
      redirect_to admin_posts_path
    end
  end

  def how_to
  end
end
