class PostsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @commentable = @post
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      redirect_to @post, notice: 'Your post was successful!'
    else
      notice = 'Something went wrong when we tried to add your post...'
      render action: 'new'
    end
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:name, :description)
  end
end
