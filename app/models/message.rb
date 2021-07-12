class Message < ApplicationRecord

  validates  :message, presence: true
  belongs_to :user
  belongs_to :room

  validates :message, presence: true, lenght: { maximum: 100 }
end
