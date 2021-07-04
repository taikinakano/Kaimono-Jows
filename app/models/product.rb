class Product < ApplicationRecord

  has_many :genres, dependent: :destroy
  belongs_to :user
  
end
