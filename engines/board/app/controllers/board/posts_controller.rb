module Board
  class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def show
      @post = Post.find(params[:id])
    end

    def new
      @post = Post.new
      @post.messages.build
    end

    def create
      @post = Post.new(post_params)
      @post.user = current_user
      @post.messages.first.user = current_user
      if @post.save
        redirect_to @post
      else
        render :new
      end
    end

    private

    def post_params
      params.require(:post).permit(
        :title,
        :messages_attributes => [:body]
      )
    end
  end
end
