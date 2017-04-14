module Board
  class MessagesController < ApplicationController
    before_action :authenticate_user!

    def create
      post = Post.find(params[:post_id])
      message = PostService.reply_to_post(current_user, post, message_params)
      if message.persisted?
        redirect_to post_path(post.id)
      else
        render :new
      end
    end

    private

    def message_params
      params.require(:message).permit(:body)
    end

  end
end
