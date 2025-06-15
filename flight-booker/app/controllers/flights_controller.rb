class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @passenger_options = [ 1, 2, 3, 4 ]

    # Get unique dates from existing flights
    @available_dates = Flight.distinct.pluck(:departure_time).map { |date| date.to_date }.uniq.sort

    # If search params exist, find matching flights
    if params[:search]
      @flights = Flight.where(
        departure_airport_id: params[:search][:departure_airport_id],
        arrival_airport_id: params[:search][:arrival_airport_id]
      ).where("DATE(departure_time) = ?", params[:search][:date])

      if request.xhr?
        render partial: "flight_results"
      end
    end
  end
end
