require "rails_helper"

RSpec.describe "Socials", type: :request do
  let(:user) { create(:user) }
  describe "facebook login" do

    it "should create new user" do
      expect(User).to receive(:from_omniauth).and_return(user)
      get "users/auth/facebook/callback"
      expect(response).to redirect_to root_path
    end

    describe "user_info and user_token" do
      before do 
        expect(User).to receive(:from_omniauth).and_return(user)  
      end
      it "should create user_info" do    
        expect(user).to receive(:create_user_info)
        get "users/auth/facebook/callback"
        expect(response).to redirect_to root_path
      end

      it "should create user_token" do    
        expect(user).to receive_message_chain(:user_tokens, :create)
        get "users/auth/facebook/callback"
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "google login" do
    it "should create new user" do
      expect(User).to receive(:find_for_google_oauth2).and_return(user)
      get "users/auth/google_oauth2/callback"
      expect(response).to redirect_to root_path
    end

    describe "user_info and user_token" do
      before do 
        expect(User).to receive(:from_omniauth).and_return(user)  
      end
      it "should create user_info" do    
        expect(user).to receive(:create_user_info)
        get "users/auth/facebook/callback"
        expect(response).to redirect_to root_path
      end

      it "should create user_token" do    
        expect(user).to receive_message_chain(:user_tokens, :create)
        get "users/auth/facebook/callback"
        expect(response).to redirect_to root_path
      end
    end
  end
end
