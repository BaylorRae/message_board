require "rails_helper"

describe Board::MessagesController do
  routes { Board::Engine.routes }

  context "POST create" do
    before do
      sign_in(user)
      allow(Board::PostService).to receive(:reply_to_post).with(user, thread, {"body" => 'message-body'}) { message }
    end

    let(:thread) { double(:post, id: 'post-id') }
    let(:user) { double(:user) }
    let(:message) { double(:message, :persisted? => true) }

    it "requires authentication" do
      sign_in(nil)
      post :create, post_id: 'post-id'
      expect(response).to redirect_to('/')
    end

    it "finds a post by id" do
      expect(Post).to receive(:find).with('post-id') { thread }
      post :create, post_id: 'post-id', message: { body: 'message-body' }
    end

    it "assigns the post to an instance variable" do
      allow(Post).to receive(:find).with('post-id') { thread }
      post :create, post_id: 'post-id', message: { body: 'message-body' }
      expect(assigns(:post)).to eq(thread)
    end

    it "assigns the message to an instance variable" do
      allow(Post).to receive(:find).with('post-id') { thread }
      post :create, post_id: 'post-id', message: { body: 'message-body' }
      expect(assigns(:message)).to eq(message)
    end

    it "redirects to the post when successful" do
      allow(message).to receive(:persisted?) { true }
      allow(Post).to receive(:find).with('post-id') { thread }
      post :create, post_id: 'post-id', message: { body: 'message-body' }
      expect(response).to redirect_to(post_path('post-id'))
    end

    it "renders the form when invalid" do
      allow(message).to receive(:persisted?) { false }
      allow(Post).to receive(:find).with('post-id') { thread }
      post :create, post_id: 'post-id', message: { body: 'message-body' }
      expect(response).to render_template('new')
    end
  end

end
