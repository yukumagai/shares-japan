class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy]
  before_filter :require_login

  def index
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    @user.update_attributes(params_user)
    redirect_to users_url(@user)
  end

   private

  def params_user
    params.require(:user).permit(:screen_name, :self_introduce, :image)
  end

end
