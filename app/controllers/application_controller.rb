class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    not_found_exception
  end

  def authenticate_admin!
    unless current_user.try(:admin?)
      not_found_exception
    end
  end

  def not_found_exception
    raise ActionController::RoutingError.new('Not Found')
  end

  def set_search
    @search = Post.search(params[:q])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :name, :gender, :birthday, :bio, :address, :avatar) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :password_confirmation, :name, :gender, :birthday, :bio, :address, :avatar) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :name, :gender, :birthday, :bio, :address, :avatar, :current_password) }
  end
end
