class Public::CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = current_member.comments.new(comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post)
  end

  def destroy
    comment = Comment.find(params[:id])
    post = comment.post
    comment.destroy
    redirect_to post_path(post)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment_body)
  end
end
