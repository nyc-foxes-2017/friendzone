class PostsController < ApplicationController
  def index
    @posts = Post.all
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
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to '/'
    else
      @errors = @post.errors
      render 'new'
    end
  end

  def update
    find_post
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def delete
    find_post
    @post.destroy


  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

  def find_post
    @post = Post.find_by(id: params[:id])
  end
end
