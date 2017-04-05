class User < ApplicationRecord
  has_many :friendships
  has_many :posts
  has_many :likes
  has_secure_password
end
