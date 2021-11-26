class LikesController < ApplicationController
  before_action :set_like

  def create
    cliant = current_cliant
    post = Post.find(params[:post_id])
    like = Like.create(cliant_id: cliant.id, post_id: post.id)
  end

  def destroy
    cliant = current_cliant
    post = Post.find(params[:post_id])
    like = Like.find_by(cliant_id: cliant.id, post_id: post.id)
    like.delete
  end

  private

  def set_like
    @post = Post.find(params[:post_id])
  end
end
