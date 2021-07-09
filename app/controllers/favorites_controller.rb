class FavoritesController < ApplicationController

  def create
    shop = Shop.find(params[:shop_id])
    favolite = current_user.favorites.new(shop_id: shop.id)
    favolite.save
    #redirect_to shop_path(shop)
  end

  def destroy
    shop = Shop.find(params[:shop_id])
    favorite = current_user.favorites.find_by(shop_id: shop.id)
    binding.pry
    favorite.destroy
    #redirect_to shop_path(shop)
  end
end
