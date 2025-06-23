class Public::SavedPostsController < ApplicationController
  before_action :ensure_guest_member
  
  def create
    @post = Post.find(params[:post_id])
    saved_post = current_member.saved_posts.new(post_id: @post.id)
    saved_post.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    saved_post = current_member.saved_posts.find_by(post_id: @post.id)
    saved_post.destroy
  end
end
