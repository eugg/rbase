class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to root_path
  end

  def authenticate_admin!
    unless current_user.try(:admin?)
      redirect_to new_user_session_path, notice: "你不是管理者"
    end
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
