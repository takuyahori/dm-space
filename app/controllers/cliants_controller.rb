class CliantsController < ApplicationController
  def show
    @nickname = current_cliant.nickname
    @posts = current_cliant.posts
  end
end
