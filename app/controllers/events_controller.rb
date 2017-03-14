class EventsController < ApplicationController
  def index
    @events = current_user.events
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.Event.build
  end

  def create
    @event = current_user.Event.build(events_params)

    if @event.save
      redirect_to @event, notice: "Event successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(events_params)
      redirect_to @event, notice: "Event successfully updated"
    else
      render 'edit'
    end
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def events_params
      params.require(:event).permit(:name, :description, :location, :price, :capacity, :includes_food, :includes_drinks, :starts_at, :ends_at, :active)
    end
end
