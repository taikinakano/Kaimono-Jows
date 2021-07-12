class Cook < ApplicationRecord

  belongs_to :user
  attachment :image
  
  validates :cook_name, presence: true, lenght: { maximum: 50 }
  
end
