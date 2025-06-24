class Public::CommentsController < ApplicationController
  before_action :authenticate_member!
  before_action :restrict_guest_member

  def create
    @post = Post.find(params[:post_id])
    @comment = current_member.comments.new(comment_params.merge(post_id: @post.id))
    @post.create_notification_comment!(current_member, @comment.id)
    if @comment.save
    else
      @comment_body = @comment
      render :error
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.destroy
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment_body)
  end
end
