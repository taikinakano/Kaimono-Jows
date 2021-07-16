class FavoritesController < ApplicationController

  def create
    @shop = Shop.find(params[:shop_id])
    favorite = @shop.favorites.new(user_id: current_user.id)
    favorite.save
    @shop.create_notification_favorite!(current_user) #通知機能の記述
    respond_to :js
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    favorite = @shop.favorites.find_by(user_id: current_user.id)
    favorite.destroy
  end
end
