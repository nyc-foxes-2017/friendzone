class User < ApplicationRecord
<<<<<<< HEAD
  has_many :posts
  has_many :likes
  has_many :liked_posts, through: :likes
  has_many :friends, source: :friendship

  validates :name, presence: true
  validates :email, presence: true

=======
  has_many :friendships
  has_many :posts
  has_many :likes
>>>>>>> f2b35ed68af6738ebf47bc4e6599d1a2fc22a085
end
