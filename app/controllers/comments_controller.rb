class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))

    if @comment.save
      flash[:notice]  = "Your comment was added"
      redirect_to post_path(@post)
    else
      render :show
    end
  end

end