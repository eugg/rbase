class Users::RegistrationsController < Devise::RegistrationsController
  def new
    session["user_social_data"] = session["devise.social_data"]
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
