class Genre < ApplicationRecord
  has_many :products, dependent: :destroy

  def self.ProductSearch_for(content, method)
      Genre.where('name LIKE ?', '%'+content+'%')
  end

end
