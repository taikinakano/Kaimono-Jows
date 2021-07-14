class ShopsController < ApplicationController

  def index
    @shops = Shop.page(params[:page]).reverse_order
  end

  def show
    @shop = Shop.find(params[:id])
    @shop_comment = ShopComment.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
    if @shop.shop_name.match(/[一-龠々]/)
      @shop.conversion_shop_name = @shop.shop_name.to_kanhira.to_roman
    elsif @shop.shop_name.is_hira? || @shop.shop_name.is_kana?
      @shop.conversion_shop_name = @shop.shop_name.to_roman
    else
      @shop.conversion_shop_name = @shop.shop_name
    end
    if @shop.address.match(/[一-龠々]/)
      @shop.conversion_address = @shop.address.to_kanhira.to_roman
    elsif @shop.address.is_hira? || @shop.address.is_kana?
      @shop.conversion_address = @shop.address.to_roman
    else
      @shop.conversion_address = @shop.address
    end
    if @shop.save
     redirect_to shop_path(@shop.id), notice: '店舗が登録されました。'
    else
      @user = User.find(current_user.id)
      @shops = @user.shops.page(params[:page]).reverse_order
      render "users/show"
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to user_path(@shop.id)
    else
      render "edit"
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    @user = User.find(current_user.id)
    redirect_to user_path(@user)
  end

   def search
      selection = params[:keyword]
      @shops = Shop.sort(selection)
   end

  private
  def shop_params
    params.require(:shop).permit(:shop_name, :image, :address, :comment, :user_id)
  end
end
