class ShopsController < ApplicationController

  def index
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
    @shop.save
    redirect_to user_path(current_user.id)
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    @shop.update(shop_params)
    redirect_to user_path(@shop.id)
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    @user = User.find(current_user.id)
    redirect_to user_path(@user)
  end

  private
  def shop_params
    params.require(:shop).permit(:shop_name, :image, :address, :comment)
  end
end
