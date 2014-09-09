require "rails_helper"

RSpec.describe "Socials", type: :request do
  let(:user) { create(:user) }
  describe "GET /auth/facebook/callback" do
    it "should create new user and user_info" do
      expect(User).to receive(:from_omniauth).and_return(user)
      expect(user).to receive(:create_user_info)
      get "users/auth/facebook/callback"
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe "GET /auth/google/callback" do
    it "should create new user and user_info" do
      expect(User).to receive(:find_for_google_oauth2).and_return(user)
      expect(user).to receive(:create_user_info)
      get "users/auth/google_oauth2/callback"
      expect(response).to redirect_to new_user_session_path
    end
  end
end
