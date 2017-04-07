class FriendshipsController < ApplicationController
  def index
    @friendships = Friendship.all
  end

  def show
    find_friendship
  end

  def new
    @friendships = Friendship.new
  end

  def edit
    find_friendship
  end

  def create
    @friendships = current_user.friendships.new(friend_params)
    byebug
    if @friendships.save
      redirect_to @friendships
    else
      render 'new'
    end
  end

  def update
    find_friendship
    if @friendships.update(friend_params)
      redirect_to @friendships
    else
      render 'edit'
    end
  end

  def delete
    find_friendship
    @friendships.destroy


  end

  private
  def friend_params
    params.require(:friend).permit(:requestee)
  end

  def find_friendship
    @friendships = Friendship.find_by(id: params[:id])
  end
end
