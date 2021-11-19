class CommentsController < ApplicationController
def create
  Comment.create(comment_params)
  redirect_to "/posts/#{comment.post.id}"
end

private

def comment_params
  params.require(:comment).permit(:text).merge(trainer_id: currrent_trainer.id, cliant_id: current_cliant.id, post_id: params[:post_id])
end
