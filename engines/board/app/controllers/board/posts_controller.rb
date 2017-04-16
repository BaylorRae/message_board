module Board
  class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index
      @posts = PostListing
        .includes(:messages => :user)
        .where('last_message_number is null or post_messages.message_number > last_message_number - 3')
        .order('post_messages.created_at desc')
    end

    def show
      @post = Post.includes(:post_messages => :user).find(params[:id])
    end

    def new
      @post = Post.new_with_message
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
