class ProjectsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @commentable = @project
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def create
    @project = current_user.projects.create(project_params)
    if @project.save
      redirect_to @project, notice: 'Your project post was successful!'
    else
      notice = 'Something went wrong when we tried to add your project...'
      render action: 'new'
    end
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :image_url, :location)
  end
end
