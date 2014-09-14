class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  ["facebook", "google_oauth2", "weibo"].each do |name|
    define_method "#{name}" do
      data = request.env["omniauth.auth"]
      provider = data["provider"]
      uid = data["uid"]
      email = data["info"]["email"]
      user_social = UserSocial.find_user_social_by_uid(provider, uid)
      if user_social
        user_social.update_social_data(data)
        sign_in_and_redirect user_social.user, bypass: true
      elsif user_by_email = User.find_by_email(email)
        user_by_email.create_user_social(data)
        sign_in_and_redirect user_by_email, bypass: true
      else
        session["devise.social_data"] = data
        redirect_to new_user_session_url, notice: "請登入或註冊"
      end
    end
  end
end
