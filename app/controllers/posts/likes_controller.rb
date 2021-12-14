module Posts
  class LikesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post


    def create
      @post.likes.where(user: current_user).first_or_create

      redirect_to user_post_path(@post.user.username, @post)
    end

    def destroy
      @post.likes.where(user: current_user).destroy_all

      redirect_to user_post_path(@post.user.username, @post)
    end

    private

    def set_post
      @post = Post.find(params[:post_id])
    end

  end

end
