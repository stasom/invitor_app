class EventsController < ApplicationController
  def index
    @events = Event.get_events_page(params[:page])
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
