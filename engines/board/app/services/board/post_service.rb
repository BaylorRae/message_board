module Board
  class PostService

    def self.reply_to_post(user, post, message_params)
      message = post.messages.build(message_params)
      message.user = user
      message.save
      message
    end

  end
end
