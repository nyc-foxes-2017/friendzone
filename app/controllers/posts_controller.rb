class PostsController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
    find_post
  end

  def new
    @post = Post.new
  end

  def edit
    find_post
  end

  def create
    current_user
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    find_post
    if @post.update(post_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def delete
    find_post
    @post.destroy

    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

  def find_post
    @post = Post.find_by(id: params[:id])
  end
end
