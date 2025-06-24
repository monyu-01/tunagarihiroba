class Public::PostsController < ApplicationController
  before_action :authenticate_member!
  before_action :restrict_guest_member, except: [:index, :show]
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :is_matching_login_user]
  before_action :set_genres, only: [:new, :edit, :create, :update, :show]
  

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.member = current_member
    if @post.save
      redirect_to member_path(current_member)
    else
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
    @comment = Comment.new
  end

  def followings
    following_ids = current_member.following_ids
    @posts = Post.where(member_id: following_ids).includes(:member, :genre).order(created_at: :desc).page(params[:page])
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to member_path(current_member)
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to member_path(current_member)
    else
      render :edit
    end
  end

  private

  def is_matching_login_user
    unless @post.member == current_member
      redirect_to posts_path
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_genres
    @genres = Genre.all
  end

  def post_params
    params.require(:post).permit(:title, :image, :body, :genre_id)
  end
end
