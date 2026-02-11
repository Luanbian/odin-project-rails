class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new, alert: "Error creating post."
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
end
