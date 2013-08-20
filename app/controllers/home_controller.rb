class HomeController < ApplicationController
  def index
    @projects = Project.all.order("updated_at DESC").paginate(page: params[:page])
    @events = Event.all.order("date DESC")
  end
end
