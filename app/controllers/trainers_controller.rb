class TrainersController < ApplicationController

  def show
    @nickname = current_trainer.nickname
    @posts = current_trainer.posts
  end
end
