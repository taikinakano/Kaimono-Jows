class Cook < ApplicationRecord

  belongs_to :user
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps
  attachment :image

  validates :cook_name, presence: true, length: { maximum: 50 }

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil? #タグの名前を配列として取得
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_cook_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_cook_tag
    end
  end
end
