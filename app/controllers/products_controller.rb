class ProductsController < ApplicationController

  def new
    @product = Product.new
    @shop = Shop.find(params[:shop_id])
  end

  def show
    @user = User.find(current_user.id)
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
    if @product.product_name.match(/[一-龠々]/)                               #漢字検索記述
      @product.conversion_product = @product.product_name.to_kanhira.to_roman
    elsif @product.product_name.is_hira? || @product.product_name.is_kana?
      @product.conversion_product = @product.product_name.to_roman
    else
      @product.conversion_product = @product.product_name
    end
    if @shop.user != current_user
      flash.now[:alert] = 'ユーザー以外が編集することはできません'#ユーザー以外を弾く
      @products = @shop.products.page(params[:page]).per(20).reverse_order
      render "products/index"
    else
      if @product.save
      redirect_to shop_products_path(@shop),notice: '商品が登録されました'
      else
        flash.now[:alert] = '商品の登録に失敗しました'
        render "index"
      end
    end
  end

  def edit
    @shop = Shop.find(params[:shop_id])
    @product = @shop.products.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:shop_id])
    @product = @shop.products.find(params[:id])
    if @shop.user != current_user
      flash.now[:alert] = 'ユーザー以外が編集することはできません'
      render "products/show"
    else
      if @product.update(product_params)
      redirect_to shop_products_path, notice: '商品が更新されました'
      else
        flash.now[:alert] = '商品の更新に失敗しました'
        render "edit"
      end
    end
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    @product = @shop.products.find(params[:id])
    @product.destroy
    redirect_to shop_products_path
  end

 	def product_search                                   #products/index検索
	  @model = params[:model]
		@content = params[:content]
		@method = params[:method]
 	  if @content == ''
 	  	@shop = Shop.find(params[:shop_id])
      @products = @shop.products.page(params[:page]).reverse_order
 	  	render 'products/index'
		elsif @model == 'product'
  	  unless @content.blank?                        #漢字、ひらがな、ローマ字検索記述
        if @content.match(/[一-龠々]/)
            @record = @content.to_kanhira.to_roman
        elsif @content.is_hira? || @content.is_kana?
           @record = @content.to_roman
        else
            @record = @content
        end
      end
		  @shop = Shop.find(params[:shop_id])
			@records = @shop.products.ProductSearch_for(@record, @method).page(params[:page]).reverse_order
		else
  		@shop = Shop.find(params[:shop_id])
  		record = @shop.genres.ProductSearch_for(@content, @method).page(params[:page]).reverse_order.first
  		@records = record.products.page(params[:page]).reverse_order
		end
	end

  private

  def product_params
    params.require(:product).permit(:genre_id, :image, :product_name, :product_memo, :price, :created_at, :updated_at)
  end
end
