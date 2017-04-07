module PostsHelper
  def current_user
    @user = User.find(session["warden.user.user.key"][0][0])
  end
end
