class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
<<<<<<< HEAD
<<<<<<< HEAD

  validates :user_id, presence: true
  validates :post_id, presence: true

=======
>>>>>>> f2b35ed68af6738ebf47bc4e6599d1a2fc22a085
=======

  validates :user_id, presence: true
  validates :post_id, presence: true
>>>>>>> 060b68631112c372744be8a7c903bb48c64dc269
end
