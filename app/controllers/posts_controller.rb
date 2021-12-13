class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save!
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:trainer)
    @comments = @post.comments.includes(:cliant)
    @likes_count = Like.where(post_id: @post.id).count
    unless cliant_signed_in? or trainer_signed_in?
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :date, :explanation, images: []).merge(cliant_id: current_cliant.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
