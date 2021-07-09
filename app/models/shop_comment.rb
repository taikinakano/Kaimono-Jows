class ShopComment < ApplicationRecord

  belongs_to :user
  belongs_to :shop
  validates :text, presence: true
end
