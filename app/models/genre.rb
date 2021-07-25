class Genre < ApplicationRecord
  has_many :products, dependent: :destroy

  def self.ProductSearch_for(content, method)
      Genre.where('name LIKE ?', '%'+content+'%')
  end

  validates :name,          presence: true, length: { minimum: 1, maximum: 20 }

end
