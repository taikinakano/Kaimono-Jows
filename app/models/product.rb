class Product < ApplicationRecord

  belongs_to :genre
  belongs_to :shop
  belongs_to :user, optional: true

  attachment :image

  validates :product_name, presence: true

  def self.ProductSearch_for(content, method)
      Product.where('conversion_product LIKE ?', '%'+content+'%')
  end

end
