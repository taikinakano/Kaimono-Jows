class ShopCommentsController < ApplicationController

  def create
    @shop = Shop.find(params[:shop_id])
    @shop_comment = @shop.shop_comments.new(shop_comment_params)
    @shop_comment.shop_id = @shop.id
    @shop_comment.user_id = current_user.id
    @shop_comment.save
    @shop.create_notification_comment!(current_user, @shop_comment.id) #通知機能の記述
    respond_to :js
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    shop_comment = @shop.shop_comments.find(params[:id])
    shop_comment.destroy!
    @shop_comment = ShopComment.new
  end

  private

  def shop_comment_params
    params.require(:shop_comment).permit(:comment)
  end
end
