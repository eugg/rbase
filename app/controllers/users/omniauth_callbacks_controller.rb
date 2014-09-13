class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    data = request.env["omniauth.auth"]
    provider = data.provider
    uid = data.uid
    email = data.email
    user_social = UserSocial.find_user_by_uid(provider, uid)
    user_by_email = User.find_by_email(email)
    if user_social
      sign_in_and_redirect user_social.user, event: :authentication
    elsif user_by_email
      user_by_email.user_socials.create_user_social(data)
      sign_in_and_redirect user, event: :authentication
    else
      session["devise.facebook_data"] = data
      redirect_to new_user_session_url
    end
  end

  def google_oauth2
    data = request.env["omniauth.auth"]
    provider = data.provider
    uid = data.uid
    email = data.email
    user_social = UserSocial.find_user_by_uid(provider, uid)
    user_by_email = User.find_by_email(email)
    if user_social
      sign_in_and_redirect user_social.user, event: :authentication
    elsif user_by_email
      user_by_email.user_socials.create_user_social(data)
      sign_in_and_redirect user, event: :authentication
    else
      session["devise.facebook_data"] = data
      redirect_to new_user_session_url
    end
  end
end
