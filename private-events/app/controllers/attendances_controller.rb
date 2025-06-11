class AttendancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event

  def create
    @attendance = current_user.attendances.build(event: @event)

    if @attendance.save
      redirect_to @event, notice: "You are now attending this event!"
    else
      redirect_to @event, alert: "Could not attend event. You might already be attending."
    end
  end

  def destroy
    @attendance = current_user.attendances.find_by(event: @event)

    if @attendance&.destroy
      redirect_to @event, notice: "You are no longer attending this event."
    else
      redirect_to @event, alert: "Could not remove attendance."
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
