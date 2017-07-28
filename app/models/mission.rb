class Mission < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :photos

  accepts_nested_attributes_for :photos
  
  validates :title, :content, :reflection, :finishdate, :category_id, presence: true
  mount_uploader :image, ImageUploader
  is_impressionable
end
