class MatchController < ApplicationController
  before_filter :redirect_to_sign_in
  def index
    @users = User.publish
  end

  def show
    @user = User.find(params[:id])
  end

  def like
    if current_user.create_like_if_nil(params[:id])
      redirect_to :back
      flash[:notice] = "已記錄你的選擇"
    else
      redirect_to :back
      flash[:alert] = "已經紀錄過囉"
    end
  end
end
