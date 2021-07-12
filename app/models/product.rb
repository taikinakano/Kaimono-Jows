class Product < ApplicationRecord

  belongs_to :genre
  belongs_to :shop

  attachment :image
  
  validates :product_name, presence: true
end
