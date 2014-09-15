class Users::SessionsController < Devise::SessionsController
  def new
    if session["devise.social_data"]
      session["user_social_data"] = session["devise.social_data"]
    else
      session["user_social_data"] = nil
    end
    super
  end

  def create
    super
    if data = session["user_social_data"]
      resource.create_user_social(data)
      session["user_social_data"] = nil
    end
  end
end
