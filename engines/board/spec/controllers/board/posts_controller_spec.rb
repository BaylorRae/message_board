require "rails_helper"

describe Board::PostsController do
  routes { Board::Engine.routes }

  context "GET show" do
    it "finds a post by id" do
      expect(Post).to receive(:find).with('post-id')
      get :show, id: 'post-id'
    end

    it "assigns the post" do
      post = double(:post)
      allow(Post).to receive(:find).with('post-id') { post }
      get :show, id: 'post-id'
      expect(assigns(:post)).to eq(post)
    end

    it "renders a 404 nicely" do
      allow(Post).to receive(:find).with('post-id') { raise ActiveRecord::RecordNotFound }
      get :show, id: 'post-id'
      expect(response).to render_template('404')
    end
  end
end
