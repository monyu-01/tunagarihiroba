class Admin::PostsController < ApplicationController
  def index
    @posts = Post.includes(:member).order(created_at: :desc).page(params[:page]).per(15)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:member).order(created_at: :desc)  
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path, notice: "投稿を削除しました"
  end
end
