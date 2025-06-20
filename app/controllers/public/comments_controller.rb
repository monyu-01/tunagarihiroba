class Public::CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_member.comments.new(comment_params.merge(post_id: @post.id))
    if @comment.save
      @post.create_notification_comment!(current_member, @comment.id)
      redirect_to post_path(@post) 
    else
      flash.now[:alert] = "コメントの投稿に失敗しました"
      render 'public/posts/show'
    end
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
