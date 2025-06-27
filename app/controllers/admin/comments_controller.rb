class Admin::CommentsController < ApplicationController
  before_action :restrict_to_admin!

  def destroy
    comment = Comment.find(params[:id])
    post = comment.post
    comment.destroy
    redirect_to admin_post_path(post), notice: "コメントを削除しました。"
  end 
end
