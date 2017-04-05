class User < ApplicationRecord
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> 060b68631112c372744be8a7c903bb48c64dc269
  has_many :posts
  has_many :likes
  has_many :liked_posts, through: :likes
  has_many :friends, source: :friendship

  validates :name, presence: true
  validates :email, presence: true
<<<<<<< HEAD

=======
  has_many :friendships
  has_many :posts
  has_many :likes
>>>>>>> f2b35ed68af6738ebf47bc4e6599d1a2fc22a085
=======
>>>>>>> 060b68631112c372744be8a7c903bb48c64dc269
end
