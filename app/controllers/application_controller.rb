class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    if session[:user_id]
      # @current_userがnilかfalseならログインユーザーを代入
      @current_user ||= User.find(session[:user_id])
    end
  end

  helper_method :current_user

  private
  def not_authenticated
    redirect_to landings_url, :alert => "ログインをお願いします。"
  end
end
