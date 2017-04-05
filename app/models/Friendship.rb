class Friendship < ApplicationRecord
  belongs_to_and_has_many :users

  validates :pending, presence: true
end