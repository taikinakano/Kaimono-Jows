class AddConversionGenreToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :conversion_genre, :string
  end
end
