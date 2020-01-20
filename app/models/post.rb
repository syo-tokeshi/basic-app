class Post < ApplicationRecord
  has_many :comments,dependent: :destroy
  validates  :title,:content, {presence:true}
  # mount_uploader :image, ImageUploader
  # has_one_attached :image
end
