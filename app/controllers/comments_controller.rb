class CommentsController < ApplicationController

  def create
    if cliant_signed_in?
      @comment = Comment.new(comment_cliant_params)
    else trainer_signed_in?
      @comment = Comment.new(comment_trainer_params)
    end
    if @comment.save!
      redirect_to "/posts/#{@comment.post.id}"
    else
      redirect_to posts_path
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      redirect_to "/posts/#{@comment.post.id}"
    end
  end

  private

  def comment_cliant_params
    params.require(:comment).permit(:text, :nickname).merge(cliant_id: current_cliant.id, post_id: params[:post_id])
  end

  def comment_trainer_params
    params.require(:comment).permit(:text, :nickname).merge(trainer_id: current_trainer.id, post_id: params[:post_id])
  end

end