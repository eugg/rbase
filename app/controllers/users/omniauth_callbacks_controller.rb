class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  ["facebook"].each do |name|
    define_method "#{name}" do
      data = request.env["omniauth.auth"]
      data.delete("extra")
      provider = data["provider"]
      uid = data["uid"]
      email = data["info"]["email"]
      user_social = UserSocial.find_user_social_by_uid(provider, uid)
      if user_social # 有登入過
        if session["devise.social_data"] # for users who logged in with another social account
          user_social.user.create_user_social(session["devise.social_data"]) # create session stores provider's user_social for user account
        end
        user_social.update_social_data(data)
        sign_in_and_redirect user_social.user, bypass: true
      else # 沒註冊
        user = User.new(email: email)
        user.skip_confirmation!
        user.save
        user.create_user_social(data)
        sign_in_and_redirect user, bypass: true
      end
    end
  end
end
