class ProductsController < ApplicationController

  def new
    @product = Product.new
    @shop = Shop.find(params[:shop_id])
  end

  def show
    @shop = Shop.find(params[:shop_id])
    @product = @shop.products.find(params[:id])
  end

  def index
    @shop = Shop.find(params[:shop_id])
    @products = @shop.products.page(params[:page]).per(20).reverse_order
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @product = @shop.products.new(product_params)
    if @product.save
    redirect_to shop_products_path(@shop),notice: '商品が登録されました'
    else
      flash.now[:alert] = '商品の登録に失敗しました'
      render "index"
    end
  end

  def edit
    @shop = Shop.find(params[:shop_id])
    @product = @shop.products.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:shop_id])
    @product = @shop.products.find(params[:id])
    if @product.update(product_params)
    redirect_to shop_products_path, notice: '商品が更新されました'
    else
      flash.now[:alert] = '商品の更新に失敗しました'
      render "edit"
    end
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    @product = @shop.products.find(params[:id])
    @product.destroy
    redirect_to shop_products_path
  end
  private

  def product_params
    params.require(:product).permit(:genre_id, :image, :product_name, :product_memo, :price, :created_at, :updated_at)
  end
end
