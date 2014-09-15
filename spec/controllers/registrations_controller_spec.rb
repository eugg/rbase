require "rails_helper"
RSpec.describe Users::RegistrationsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:user_social) { create(:user_social, user_id: user.id) }

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end
  describe "custom Create test" do
    before do 
      session["user_social_data"] = facebook_hash
    end
    it "should create user_social" do
      expect(user).to receive(:create_user_social)
      post :create
    end
  end
end