class LikesController < ApplicationController
  def index
    @Likes = Like.all
  end

  def show
    find_like
  end

  def new
    @like = Like.new
  end

  def edit
    find_like
  end

  def create
    @like = Like.new(like_params)
    if @like.save
      redirect_to @like
    else
      render 'new'
    end
  end

  def update
    find_like
    if @like.update(like_params)
      redirect_to @like
    else
      render 'edit'
    end
  end

  def delete
    find_like
    @like.destroy


  end

  private
  def like_params
    params.require(:like).permit(:user, :post)
  end

  def find_like
    @like = Like.find_by(id: params[:id])
  end
end
