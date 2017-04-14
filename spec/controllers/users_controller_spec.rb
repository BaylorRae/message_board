require "rails_helper"

describe UsersController do

  let(:user) { double(:user) }

  before { sign_in(user) }

  context "GET edit" do
    it "requires authentication" do
      sign_in(nil)
      get :edit
      expect(response).to redirect_to('/users/sign_in')
    end

    it "assigns the current user" do
      get :edit
      expect(assigns(:user)).to eq(user)
    end

    it "renders edit template" do
      sign_in
      get :edit
      expect(response).to render_template('edit')
    end
  end

  context "PATCH update" do
    it "requires authentication" do
      sign_in(nil)
      patch :update
      expect(response).to redirect_to('/users/sign_in')
    end

    it "updates the current user" do
      expect(user).to receive(:update_attributes).with('email' => 'new-email')
      patch :update, user: { email: 'new-email' }
    end

    it "redirects to home when successful" do
      allow(user).to receive(:update_attributes).with('email' => 'new-email') { true }
      patch :update, user: { email: 'new-email' }
      expect(response).to redirect_to('/')
    end

    it "renders edit when invalid" do
      allow(user).to receive(:update_attributes).with('email' => 'new-email') { false }
      patch :update, user: { email: 'new-email' }
      expect(response).to render_template(:edit)
    end
  end

end
