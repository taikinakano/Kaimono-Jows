class GenresController < ApplicationController

  def new
    @genre = Genre.new
    @shop = Shop.find(params[:shop_id])
    @genres = @shop.genres.all
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @genre = @shop.genres.new(genre_params)
    if @genre.save
      redirect_to new_shop_genre_path, notice: "ジャンルを登録しました。"
    else
      @genres = Genre.all
      render "new"
    end
  end

  def edit
    @shop = Shop.find(params[:shop_id])
    @genre = @shop.genres.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:shop_id])
    @genre = @shop.genres.find(params[:id])
    @genre.update(genre_params)
    redirect_to new_shop_genre_path
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    @genre = @shop.genres.find(params[:id])
    @genre.destroy
    redirect_to new_shop_genre_path
  end
  private

  def genre_params
    params.require(:genre).permit(:name, :created_at, :updated_at)
  end
end
