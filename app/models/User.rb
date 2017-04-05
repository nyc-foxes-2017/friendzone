class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :liked_posts, through: :likes
  has_many :friends, source: :friendship


  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: {in: 6..20}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def request(user)
    Friendship.new(requester: self.id, requestee: user.id)
  end

end
