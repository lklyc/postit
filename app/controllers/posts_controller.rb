class PostsController < ApplicationController
  def index

  end

  def show
    # @post is an instance variable
    @post = Post.find(params[:id])
    render :show
  end
end
