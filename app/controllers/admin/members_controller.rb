class Admin::MembersController < ApplicationController
  def index
    @members = Member.where.not(email: 'guest@example.com').order(created_at: :desc).page(params[:page]).per(15)
  end

  def show
    @member = Member.find(params[:id])
    @posts = @member.posts.order(created_at: :desc)  
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to admin_members_path, notice: "メンバーを削除しました"
  end
end
