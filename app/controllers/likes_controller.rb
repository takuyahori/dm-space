class LikesController < ApplicationController
  before_action :set_like

  def create
    trainer = current_trainer
    cliant = current_cliant
    post = Post.find(params[:post_id])
    if cliant_signed_in?
      like = Like.create(cliant_id: cliant.id, post_id: post.id)
    else trainer_signed_in?
      like = Like.create(trainer_id: trainer.id, post_id: post.id)
    end
  end

  def destroy
    trainer = current_trainer
    cliant = current_cliant
    post = Post.find(params[:post_id])
    if cliant_signed_in?
     like = Like.find_by(cliant_id: cliant.id, post_id: post.id)
   else trainer_signed_in?
      like = Like.find_by(trainer_id: trainer.id, post_id: post.id)
   end
    like.delete
  end

  private

  def set_like
    @post = Post.find(params[:post_id])
  end
end
