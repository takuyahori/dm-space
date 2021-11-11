class PostsController < ApplicationController
  before_action :set_post, only: [:show]

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
  end

  private

  def post_params
    params.require(:post).permit(:title, :date, :explanation, images: []).merge(cliant_id: current_cliant.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
