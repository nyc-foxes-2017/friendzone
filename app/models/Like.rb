class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
<<<<<<< HEAD

  validates :user_id, presence: true
  validates :post_id, presence: true

=======
>>>>>>> f2b35ed68af6738ebf47bc4e6599d1a2fc22a085
end
