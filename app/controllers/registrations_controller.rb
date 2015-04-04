class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    p "saiwaki"
    logger.debug @user.inspect

    if @user.save
      auto_login(@user)
      redirect_to users_url
    else
      render :new
    end
  end

  private

  def params_user
    params.require(:user).permit(:image, :first_name, :last_name, :screen_name, :email, :password, :password_confirmation)
  end
end
