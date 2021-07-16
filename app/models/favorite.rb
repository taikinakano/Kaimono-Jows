class Favorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :shop
  validates_uniqueness_of :shop_id, scope: :user_id #一人が一つの投稿に対して一度しか投稿できない
end
