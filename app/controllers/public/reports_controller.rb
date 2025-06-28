class Public::ReportsController < ApplicationController
  before_action :restrict_to_member!
  before_action :restrict_guest_member
  before_action :check_user_status

  def new
    @report = Report.new
    @member = Member.find(params[:member_id])
  end

  def create 
    @member = Member.find(params[:member_id])
    @report = Report.new(report_params)
    @report.reporter_id = current_member.id
    @report.reported_id = @member.id 

    if @report.save
      redirect_to member_path(@member), notice: "通報が完了しました。"
    else
      render :new
    end
  end

  private

  def report_params
    params.require(:report).permit(:reason)
  end
  
end
