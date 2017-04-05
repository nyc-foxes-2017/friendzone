class Friendship < ApplicationRecord
  has_and_belongs_to_many :users

  validates :pending, presence: true
  validates :requester_requestee

  def requester_requestee
    if self.requester == self.requestee
      errors.add_to_base("You can't friend yourself!")
    end
  end
end
