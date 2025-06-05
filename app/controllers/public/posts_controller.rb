class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    if @post.save
      redirect_to member_path(current_member)
    else
      render :new
    end
  end

  def index
  end

  def show
  end

  def followings_posts
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :body)
  end
end
