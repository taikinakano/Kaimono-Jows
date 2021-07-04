class Product < ApplicationRecord

  has_many :genres, dependent: :destroy
  belongs_to :shop

  attachment :image
end
