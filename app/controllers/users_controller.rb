class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    find_user
  end

  def new
    @user = User.new
  end

  def edit
    find_user
  end

  def create
    @user = User.new(user_params)
    byebug
    if @user.save
      redirect_to show
    else
      render 'new'
    end
  end

  def update
    find_user
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def delete
    find_user
    @user.destroy


  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :avatar_url)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
