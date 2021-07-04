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

  private

  def genre_params
    params.require(:genre).permit(:shop_id, :name, :created_at, :updated_at)
  end
end
