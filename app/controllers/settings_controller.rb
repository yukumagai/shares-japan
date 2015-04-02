class SettingsController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update_attributes(params_user)
    redirect_to user_url(@user)
  end

  private

  def params_user
    params.require(:user).permit(:last_name, :firts_name, :introduce, :image, :image_cache, :remove_image)
  end
end
