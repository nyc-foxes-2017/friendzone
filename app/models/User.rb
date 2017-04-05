class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :liked_posts, through: :likes
#  has_many :friends, class_name: :friendship

  validates :name, presence: true
  validates :email, presence: true

  def request(user)
    Friendship.new(requester: self.id, requestee: user.id)
  end

  def friends
    friendships = Friendship.where("(requester = ? or requestee = ?) and pending = ?", self.id, self.id, false)
    @unique_friends = friendships.map do |f|
      f.requester == self.id ? f.requestee :  f.requester
    end
    @unique_friends
  end

  def requests
    @requests = Friendship.where("requestee = ? and pending = ?", self.id, true)
  end

  def own_requests
    @own_requests = Friendship.where("requester = ? and pending = ?", self.id, true)
  end
end
