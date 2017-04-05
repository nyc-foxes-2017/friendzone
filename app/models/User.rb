class User < ApplicationRecord


  has_many :posts
  has_many :likes
  has_many :liked_posts, through: :likes
  has_many :friends, source: :friendship

  validates :name, presence: true
  validates :email, presence: true
end
