class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # before_filter :require_login

  def index
    
  end
  
  def show
    @user = User.find(params[:id])
  end
end
