class Mission < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  validates :title, presence: true

  mount_uploader :image, ImageUploader
end
