class CommentsController < ApplicationController
  before_filter :load_commentable
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new 
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.username = User.find(@comment.user_id).username
    if @comment.save
      redirect_to @commentable, notice: 'Comment created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :commentable_id, :commentable_type, :body)
  end

  def load_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end
