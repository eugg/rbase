require "rails_helper"

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  let!(:user) { create(:user) }
  let!(:user_social) { create(:user_social) }

  describe "facebook login" do
    before do
      request.env["devise.mapping"] = Devise.mappings[:user] # If using Devise
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
    end
    it "should look for user_social" do
      expect(UserSocial).to receive(:find_user_by_uid)
      get :facebook
    end
    it "should look for user_social and match existing user" do
      expect(UserSocial).to receive(:find_user_by_uid).and_return(user_social)
      expect(subject).to receive(:sign_in_and_redirect).with(user_social.user, event: :authentication)
      get :facebook
    end

    it "should find user by email" do
      # request.env["omniauth.auth"].info.email = user.email
      expect(UserSocial).to receive(:find_user_by_uid).and_return(nil)
      binding.pry
      expect(User).to receive(:find_by_email).and_return(user)
      expect(user).to receive(:create_user_social)
      get :facebook
    end
  end

  describe "google login" do
  end
end
