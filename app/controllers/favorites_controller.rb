class FavoritesController < ApplicationController

  def create
    @shop = Shop.find(params[:shop_id])
    favorite = @shop.favorites.new(user_id: current_user.id)
    favorite.save
    #render :create#redirect_to shop_path(@shop)
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    favorite = @shop.favorites.find_by(user_id: current_user.id)
    favorite.destroy
    #render :destroy#redirect_to shop_path(@shop)
  end
end
