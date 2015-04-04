class ItemsController < ApplicationController
  before_filter :require_login

  def index
    @item = Item.new
    @user = current_user
  end

  def show
    @item = Item.find(params[:id])
    @user = current_user
    @items = Item.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @item = Item.new(items_user)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = current_user
    @user.update_attributes(params_user)
    redirect_to items_url(@user)
  end

   private

  def items_user
    params.require(:item).permit(:name, :image, :date)
  end
end
