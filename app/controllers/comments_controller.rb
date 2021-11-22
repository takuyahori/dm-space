class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save!
      redirect_to "/posts/#{@comment.post.id}"
    else
      redirect_to posts_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(cliant_id: current_cliant.id, post_id: params[:post_id])
  end
end