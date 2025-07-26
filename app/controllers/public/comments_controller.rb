class Public::CommentsController < ApplicationController
  before_action :restrict_to_member!
  before_action :restrict_guest_member
  before_action :check_user_status

  def create
    @post = Post.find(params[:post_id])
    @comment = current_member.comments.new(comment_params.merge(post_id: @post.id))
    
    if @comment.save
      @post.create_notification_comment(current_member, @comment.id)
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
