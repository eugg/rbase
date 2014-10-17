class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  ["facebook", "google_oauth2", "weibo"].each do |name|
    define_method "#{name}" do
      data = request.env["omniauth.auth"]
      data.delete("extra")
      provider = data["provider"]
      uid = data["uid"]
      email = data["info"]["email"]
      user_social = UserSocial.find_user_social_by_uid(provider, uid)
      if user_social # 用社群登入
        if session["devise.social_data"] # for users who logged in with another social account
          user_social.user.create_user_social(session["devise.social_data"]) # create session stores provider's user_social for user account
        end
        user_social.update_social_data(data)
        sign_in_and_redirect user_social.user, bypass: true
      elsif user_by_email = User.find_by_email(email) # 沒社群但有同email
        if !user_by_email.confirmed? # 確認使用者是不是手動創建但沒認證
          user_by_email.confirm!
        end
        user_by_email.create_user_social(data)
        sign_in_and_redirect user_by_email, bypass: true
      else # 沒社群也找不到對應email的user
        session["devise.social_data"] = data
        redirect_to new_user_registration_url, notice: "請登入或註冊"
      end
    end
  end
end
