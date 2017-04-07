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
    @like = Like.new
    @like.post_id = params[:post_id]
    @like.user_id = current_user.id
    if @like.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  def update
    find_like
    if @like.update(like_params)
      redirect_to '/'
    else
      render 'edit'
    end
  end

  def destroy
    find_like
    @like.destroy
    redirect_to '/'
  end

  private
  def like_params
    params.require(:like).permit(:post)
  end

  def find_like
    @like = Like.find(params[:id])
  end
end
