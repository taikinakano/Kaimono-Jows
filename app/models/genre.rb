class Genre < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :shop
end
