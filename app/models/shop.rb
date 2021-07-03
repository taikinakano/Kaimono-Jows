class Shop < ApplicationRecord

  belongs_to :user
  attachment :image
end
