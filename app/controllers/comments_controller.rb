class CommentsController < ApplicationController
  def index
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      # add that comment to the list with ajax
    else
      notice = 'Something went wrong when we tried to add your comment...'
      # reload the page?
    end
  end

  def edit
  end

  def update
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :body)
  end
end
