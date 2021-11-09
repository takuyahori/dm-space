class PostsController < ApplicationController
  def index
    @posts = Post.includes(:cliant)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :today, :explanation, :image).merge(cliant_id: current_cliant.id)
  end
end
