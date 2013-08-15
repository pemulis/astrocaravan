class HomeController < ApplicationController
  def index
    @projects = Project.all
    @events = Event.all
  end
end
