class Mission < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title, presence: true

  mount_uploader :image, ImageUploader
end
