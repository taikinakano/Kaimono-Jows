class Shop < ApplicationRecord

  belongs_to :user
  has_many   :products,      dependent: :destroy
  has_many   :genres,        dependent: :destroy
  has_many   :favorites,     dependent: :destroy
  has_many   :bookmarks,     dependent: :destroy
  has_many   :shop_comments, dependent: :destroy
  attachment :image

  validates  :shop_name,     presence: true
  validates  :address,       presence: true
  validates  :comment,       presence: true

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search_for(content, method)
      Shop.where('conversion_shop_name LIKE ?', '%'+content+'%')
  end

  def self.searched_for(content, method)
      Shop.where('conversion_address LIKE ?', '%'+content+'%')
  end

  def self.sort(selection)
    case selection
    when 'new'
      return all.order(created_at: :DESC)
    when 'old'
      return all.order(created_at: :ASC)
    when 'likes'
      return find(Favorite.group(:shop_id).order(Arel.sql('count(shop_id) desc')).pluck(:shop_id))
    when 'dislikes'
      return find(Favorite.group(:shop_id).order(Arel.sql('count(shop_id) asc')).pluck(:shop_id))
    end
  end
end
