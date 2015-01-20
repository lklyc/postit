class PostsController < ApplicationController
  # checkout the before_action function in private. Gets execute before action show, edit and update
  before_action :set_post, only: [:show, :edit, :update]
  # why we use before_action
  # 1. set up instance variablie for action
  # 2. redirect based on some condition, basically skipping the action

  def index
    @post = Post.all
  end

  def show 
    @comment = Comment.new
    render :show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = User.first # hard coded: change once we have authentication

    if @post.save
      flash[:notice] = "Your post was created."
      redirect_to posts_path
    else #validtion error, have to render so new action has access to instance varaibles
      render :new
    end
  end

  def edit
  end

  def update

    if @post.update(post_params)
      flash[:notice] = "The Post was Updated"
      redirect_to post_path(@post)
    else
      render :edit
    end

  end



  private

  def post_params
    params.require(:post).permit(:title, :url, :description)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
