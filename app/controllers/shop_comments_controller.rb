class ShopCommentsController < ApplicationController

  def create
    shop = Shop.find(params[:shop_id])
    comment = current_user.shop_comments.new(shop_comment_params)
    comment.shop_id = shop.id
    comment.save
    redirect_to shop_path(shop)
  end

  def destroy
  end

  private

  def shop_comment_params
    params.require(:shop_comment).permit(:comment)
  end
end
