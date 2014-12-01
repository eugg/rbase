class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  ["facebook", "google_oauth2"].each do |name|
    define_method "#{name}" do
      data = request.env["omniauth.auth"] # reference from https://github.com/intridea/omniauth/wiki/Auth-Hash-Schema
      data.delete("extra")
      provider = data["provider"]
      uid = data["uid"]
      email = data["info"]["email"]
      user_social = UserSocial.includes(:user).find_user_social_by_uid(provider, uid)

      if user_social && user_social.user # already registration
        if session["devise.social_data"] # 當用社群帳號(不同 email時）註冊又登入社群帳號時
          if !user_social.user.confirmed?
            user_social.user.confirm!
          end
          user_social.user.create_user_social(session["devise.social_data"])
        end

        user_social.update_social_data(data)
        sign_in_and_redirect user_social.user, bypass: true
      elsif user = User.find_by_email(email) # 此 email 已有註冊，綁定 user social
        if !user.confirmed?
          user.confirm!
        end
        user.create_user_social(data)
        sign_in_and_redirect user, bypass: true
      else
        session["devise.social_data"] = data
        # redirect_to new_user_session_path, notice: "請完成註冊或登入"
        redirect_to new_user_registration_path, notice: "請輸入密碼完成註冊"
      end
    end
  end
end
