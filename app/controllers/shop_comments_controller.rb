class ShopCommentsController < ApplicationController

  def create
    shop = Shop.find(params[:shop_id])
    comment = current_user.shop_comments.new(shop_comment_params)
    comment.shop_id = shop.id
    comment.save
     #redirect_to shop_path(shop)
    #else
      #render "shop/show"
    #end
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    shop_comment = @shop.shop_comments.find(params[:id])
    shop_comment.destroy
  end

  private

  def shop_comment_params
    params.require(:shop_comment).permit(:comment)
  end
end
