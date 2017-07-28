class Mission < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  validates :title, :content, :reflection, :finishdate, :category_id, presence: true
  mount_uploader :image, ImageUploader
  is_impressionable
end
