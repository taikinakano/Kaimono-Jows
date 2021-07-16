class ShopComment < ApplicationRecord

  belongs_to :user
  belongs_to :shop
  has_many :notifications, dependent: :destroy
  validates :comment, presence: true
end
