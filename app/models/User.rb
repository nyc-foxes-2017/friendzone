class User < ApplicationRecord
  has_many :friendships
  has_many :posts
  has_many :likes
end
