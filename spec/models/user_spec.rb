require "rails_helper"

describe User do

  context "full_name" do
    let(:user) { User.new(first_name: 'first', last_name: 'last') }

    it "combines first and last name" do
      expect(user.full_name).to eq('first last')
    end

    it "doesn't introduce trailing space" do
      user.last_name = nil
      expect(user.full_name).to eq('first')
    end

    it "doesn't introduce leading space" do
      user.first_name = nil
      expect(user.full_name).to eq('last')
    end

    it "doesn't remove user spaces" do
      user.first_name = ' spaced first name '
      user.last_name = nil
      expect(user.full_name).to eq(' spaced first name ')
    end
  end

  context "display_name" do
    let(:user) { User.new }

    it "uses full_name when available" do
      allow(user).to receive(:full_name) { 'full name' }
      expect(user.display_name).to eq('full name')
    end

    it "defaults to email address" do
      user.email = 'email@example.com'
      allow(user).to receive(:full_name) { '' }
      expect(user.display_name).to eq('email@example.com')
    end
  end

end
