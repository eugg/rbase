class Users::RegistrationsController < Devise::RegistrationsController
  def new
    if session["devise.social_data"]
      session["user_social_data"] = session["devise.social_data"]
    end
    super
  end

  def create
    super
    if resource.save && data = session["user_social_data"]
      if resource.avatar.url.nil? && image_url = (data["info"]["picture"] || data["info"]["image"])
        resource.remote_avatar_url = image_url.gsub!('http://','https://')
        resource.save
      end
      resource.create_user_social(data)
      session["user_social_data"] = nil
    end
  end
end
