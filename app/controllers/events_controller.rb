class EventsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @commentable = @event
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def create
    @event = current_user.events.create(event_params)
    if @event.save
      redirect_to @event, notice: 'Your event post was successful!'
    else
      notice = 'Something went wrong when we tried to add your event...'
      render action: 'new'
    end
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :image_url, :location, :date)
  end

end
