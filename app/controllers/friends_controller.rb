class FriendsController < ApplicationController
  def index
    @friends = Friend.all
  end

  def show
    find_friend
  end

  def new
    @friend = Friend.new
  end

  def edit
    find_friend
  end

  def create
    @friend = Friend.new(friend_params)
    if @friend.save
      redirect_to @friend
    else
      render 'new'
    end
  end

  def update
    find_friend
    if @friend.update(friend_params)
      redirect_to @friend
    else
      render 'edit'
    end
  end

  def delete
    find_friend
    @friend.destroy


  end

  private
  def friend_params
    params.require(:friend).permit(:requestee)
  end

  def find_friend
    @friend = Friend.find_by(id: params[:id])
  end
end
