class Public::PostsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :authenticate_member!

  def new
    @post = Post.new
    @genres = Genre.all
  end

  def create
    @post = Post.new(post_params)
    @post.member = current_member
    if @post.save
      redirect_to member_path(current_member)
    else
      @genres = Genre.all
      render :new
    end
  end

  def index
    @posts = Post.includes(:genre, :member)
    @genres = Genre.all

    if params[:keyword].present?
      kw = "%#{params[:keyword]}%"
      @posts = @posts.where("posts.title LIKE :kw OR posts.body LIKE:kw OR members.name LIKE :kw", kw: kw).joins(:member)
    end

    if params[:genre_ids].present?
      @posts = @posts.where(genre_id: params[:genre_ids])
    end

    @posts = @posts.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def followings_posts
  end

  def edit
    @post = Post.find(params[:id])
    @genres = Genre.all
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to member_path(current_member)
    else
      @genres = Genre.all
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to member_path(current_member)
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :body, :genre_id)
  end

  def is_matching_login_user
    @post = Post.find(params[:id])
    unless @post.member == current_member
      redirect_to posts_path
    end
  end
end
