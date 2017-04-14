require "rails_helper"

module Board
  describe PostService do

    context "reply_to_post" do
      let(:bob) { User.create!(email: 'bob@example.com', password: 'secret') }
      let(:alice) { User.create!(email: 'alice@example.com', password: 'secret') }
      let(:post) { Post.create!(title: 'post-title', user: bob) }

      it "creates a message for a post" do
        message = PostService.reply_to_post(alice, post, body: 'message-body')
        expect(message.body).to eq('message-body')
      end

      it "assigns the user to the message" do
        message = PostService.reply_to_post(alice, post, body: 'message-body')
        expect(message.user).to eq(alice)
      end

      it "doesn't assign a user from message" do
        message = PostService.reply_to_post(alice, post, body: 'message-body', user_id: bob.id)
        expect(message.user).to eq(alice)
      end

      it "saves the message" do
        message = PostService.reply_to_post(alice, post, body: 'message-body')
        expect(message).to be_persisted
      end
    end

  end
end
