class Post < ApplicationRecord
  validates :title, presence: true, length: {maximum: 140}
  mount_uploader :image, ImageUploader

  belongs_to :group, inverse_of: :posts
  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings, source: :tag
end
