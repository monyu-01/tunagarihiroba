class Admin::ReportsController < ApplicationController
  def index
    @reports = Report.includes(:reporter, :reported).order(created_at: :desc).page(params[:page]).per(15)
  end

  def show
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      redirect_to admin_reports_path, notice: "対応ステータスを更新しました。"
    else
      render :show
    end
  end

  private

  def report_params
    params.require(:report).permit(:checked)
  end
end
