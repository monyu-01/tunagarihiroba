class Public::HomesController < ApplicationController
  def top
    if member_signed_in?
      redirect_to member_path(current_member)
    end
  end

  def how_to
  end
end
