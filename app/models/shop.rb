class Shop < ApplicationRecord

  belongs_to :user
  has_many :products, dependent: :destroy
  has_many :genres, dependent: :destroy
  attachment :image
end
