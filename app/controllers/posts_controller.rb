class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path, notice: "Created a post!"
    else
      render :new, notice: "Please try again"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(@post.user.username), notice: "Post deleted."
  end

  private

  def post_params
    params.require(:post).permit(:image)
  end
end
