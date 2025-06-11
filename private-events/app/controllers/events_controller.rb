class EventsController < ApplicationController
    before_action :authenticate_user!  # Devise: ensures user is logged in

    def index
      @events = Event.all
    end

    def new
      @event = current_user.created_events.build  # automatically sets creator_id
    end

    def create
      @event = current_user.created_events.build(event_params)

      if @event.save
        redirect_to @event, notice: "Event created successfully!"
      else
        render :new
      end
    end

    def show
      @event = Event.find(params[:id])
    end

    private

    def event_params
      params.require(:event).permit(:name, :location, :date)
    end
end
