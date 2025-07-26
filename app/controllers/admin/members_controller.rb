class Admin::MembersController < ApplicationController
  before_action :restrict_to_admin!
  before_action :set_member, only: [:show, :update, :deactivate, :reactivate]

  def index
    @members = Member.where.not(email: 'guest@example.com').order(created_at: :desc).page(params[:page]).per(15)
  end

  def show
    @posts = @member.posts.order(created_at: :desc)  
  end

  def update
    if @member.update(member_params)
      redirect_to admin_member_path(@member), notice: "ステータスを更新しました。"
    else
      flash.now[:alert] = "ステータスの更新に失敗しました。"
      render :show
    end
  end  

  def deactivate
    @member.update(user_status: :suspended)
    redirect_to admin_members_path, notice: "メンバーを利用停止にしました。"
  end

  def reactivate
    @member.update(user_status: :available)
    redirect_to admin_members_path, notice: "メンバーを利用再開しました。"
  end

  private

  def member_params
    params.require(:member).permit(:user_status)
  end

  def set_member
    @member = Member.find(params[:id])
  end
end
