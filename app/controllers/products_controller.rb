class ProductsController < ApplicationController

  def new
    @product = Product.new
    @shop = Shop.find(params[:shop_id])
  end

  def show
    @shop = Shop.find(params[:shop_id])
    @product = @shop.products.find(params[:id])
    #@genre = @shop.genre.all
  end

  def index
    @shop = Shop.find(params[:shop_id])
    @products = @shop.products.page(params[:page]).reverse_order
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @product = @shop.products.new(product_params)
    @product.save
    redirect_to shop_products_path(@shop)
  end

  private

  def product_params
    params.require(:product).permit(:genre_id, :image, :product_name, :product_memo, :price, :created_at, :updated_at)
  end
end
