class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to root_path
  end

  def admin_user?
    if !current_user.try(:admin?)
      redirect_to root_path, notice: "你不是管理者！"
    end
  end
end
