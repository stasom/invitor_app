class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.get_events_page(params[:page])
  end

  def my_index
    @events = Event.get_events_page(params[:page])
  end

  def show
    @event_invitations = @event.invitations.where(accepted: true)
    #puts @event_invitations
  end

  def new
    @event = Event.new
    @event.owner = User.find(params[:owner_id])
  end

  def edit
  end

  def create
    #@event_user = params[:event][:user_id]
    @event = Event.new(event_params)
    @event.owner = current_user
    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: 'Event was successfully destroyed.'
  end

  private
  def set_event
    begin
      @event = Event.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to events_path, notice: "We did not find that Event."
    end
  end

  def event_params
    params.require(:event).permit(:name, :description, :start_date, :end_date, :location)
  end
end

# The require method ensures that a specific parameter is present, and if it's not provided, 
# the require method throws an error. It returns an instance of ActionController::Parameters for the key passed into require.
# The permit method returns a copy of the parameters object, returning only the permitted keys and values. 
# When creating a new ActiveRecord model, only the permitted attributes are passed into the model.
