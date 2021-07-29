class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shops,                     dependent: :destroy
  has_many :products,                  dependent: :destroy
  has_many :cooks,                     dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :followings, through: :relationships, source: :followed
  has_many :entries#DM機能始まり
  has_many :messages
  has_many :rooms, through: :entries#DM機能終わり
  has_many :favorites,                 dependent: :destroy
  has_many :bookmarks,                 dependent: :destroy
  has_many :shop_comments,             dependent: :destroy
  has_many :events,                    dependent: :destroy
  has_many :searchs,                   dependent: :destroy
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  has_many :tags,                      dependent: :destroy
  attachment :image
  attachment :bgimage

  validates :name,           presence: true, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :email,          presence: true


  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end


  def create_notification_follow!(current_user) #follow通知機能
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end

end
