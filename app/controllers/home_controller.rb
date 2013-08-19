class HomeController < ApplicationController
  def index
    @projects = Project.paginate(page: params[:page])
    @events = Event.all
  end
end
