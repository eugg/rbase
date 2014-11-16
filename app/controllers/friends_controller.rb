class FriendsController < ApplicationController
  before_filter :redirect_to_sign_in
  def index
    facebook_auth = current_user.user_socials.where(provider: "facebook").first
    access_token = facebook_auth.token
    uid = facebook_auth.uid
    @user = FbGraph::User.me(access_token)
    @user = FbGraph::User.fetch(uid, access_token: access_token)
  end

  def like
    
  end
end
