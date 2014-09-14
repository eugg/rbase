class Users::SessionsController < Devise::SessionsController
  def new
    @@user_social_data = session["devise.social_data"]
    super
  end

  def create
    super
    if data = @@user_social_data
      resource.create_user_social(data)
    end
  end
end
