class HomeController < ApplicationController
  def index
    @posts = Post.all
    @projects = Project.all
    @events = Event.all
  end
end
