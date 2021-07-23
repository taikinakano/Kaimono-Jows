class GenresController < ApplicationController
 before_action :shop_params
  def new
    @genre = Genre.new
    # @shop = Shop.find(params[:shop_id])
    @genres = @shop.genres.all
  end

  def create
    # @shop = Shop.find(params[:shop_id])
    @genre = @shop.genres.new(genre_params)
    if @genre.name.match(/[一-龠々]/)
      @genre.conversion_genre = @product.name.to_kanhira.to_roman
    elsif @product.name.is_hira? || @product.name.is_kana?
      @product.conversion_genre = @product.name.to_roman
    else
      @product.conversion_genre = @product.name
    end
    if @genre.save
      redirect_to new_shop_genre_path, notice: "ジャンルを登録しました。"
    else
      @genres = Genre.all
      render "new"
    end
  end

  def edit
    # @shop = Shop.find(params[:shop_id])
    @genre = @shop.genres.find(params[:id])
  end

  def update
    # @shop = Shop.find(params[:shop_id])
    @genre = @shop.genres.find(params[:id])
    if @genre.name.match(/[一-龠々]/)
      @genre.conversion_genre = @genre.name.to_kanhira.to_roman
    elsif @product.name.is_hira? || @genre.name.is_kana?
      @product.conversion_genre = @genre.name.to_roman
    else
      @genre.conversion_genre = @genre.name
    end
    @genre.update(genre_params)
    redirect_to new_shop_genre_path
  end

  def destroy
    # @shop = Shop.find(params[:shop_id])
    @genre = @shop.genres.find(params[:id])
    @genre.destroy
    redirect_to new_shop_genre_path
  end
  private

  def genre_params
    params.require(:genre).permit(:id, :name, :created_at, :updated_at)
  end

  def shop_params
    @shop = Shop.find(params[:shop_id])
  end

end
