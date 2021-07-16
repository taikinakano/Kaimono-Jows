class Message < ApplicationRecord

  validates  :message, presence: true
  belongs_to :user
  belongs_to :room

  validates :message, presence: true, length: { maximum: 100 }
end
