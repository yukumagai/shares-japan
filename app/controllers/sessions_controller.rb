class SessionsController < ApplicationController
  def new
    @user = User.new
    @item = Item.new
  end

  def create
    email    = params_user[:email]
    password = params_user[:password]

    if login(email, password)
      redirect_to users_url, notice: "ログインに成功しました。"
    else
      @user = User.new(email: email)
      render :new
    end
  end

    def destroy
      logout
      redirect_to landings_url, notice: "ログアウトしました。"
    end

  private

  def params_user
    params.require(:user).permit(:email, :password)
  end
end
