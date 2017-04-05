module ApplicationHelper
    def is_not_a_friend(user_id)
    if current_user.id != user_id
      # if current_user.friends.find(user_id) == nil
      # end
    end
  end
end
