require "rails_helper"

describe Post do
  context "new_with_message" do
    it "initializes with a message" do
      post = Post.new_with_message
      message = post.messages.first
      expect(message).to be_new_record
    end
  end
end
