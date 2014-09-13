class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    data = request.env["omniauth.auth"]
    provider = data.provider
    uid = data.uid
    email = data.info.email
    user_social = UserSocial.find_user_by_uid(provider, uid)
    if user_social
      sign_in_and_redirect user_social.user, event: :authentication
    elsif user_by_email = User.find_by_email(email)
      user_by_email.create_user_social(data)
      sign_in_and_redirect user_by_email, event: :authentication
    else
      session["devise.facebook_data"] = data
      redirect_to new_user_registration_url
    end

    # 還差使用者選擇登入後，自動建立user_social的情況
  end

  def google_oauth2
    data = request.env["omniauth.auth"]
    provider = data.provider
    uid = data.uid
    email = data.info.email
    user_social = UserSocial.find_user_by_uid(provider, uid)
    if user_social
      sign_in_and_redirect user_social.user, event: :authentication
    elsif user_by_email = User.find_by_email(email)
      user_by_email.create_user_social(data)
      sign_in_and_redirect user_by_email, event: :authentication
    else
      session["devise.facebook_data"] = data
      redirect_to new_user_registration_url
    end
  end
end
