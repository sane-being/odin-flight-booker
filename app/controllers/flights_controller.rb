class FlightsController < ApplicationController
  before_action :set_flight, only: %i[ show ]

  # GET /flights or /flights.json
  def index
    if params.include? :flight_id
      @flight = Flight.find(params.expect(:flight_id))
      redirect_to new_flight_booking_path(
        @flight,
        passenger_count: params.expect(:passenger_count)
      )
    end

    search_params = [ :departure_datetime, :arrival_airport_id, :departure_airport_id ]
    if search_params.all? { |key| params.include? key }
      @flights = Flight.where(
        "departure_airport_id = ? AND arrival_airport_id = ? AND DATE(departure_datetime) = ?",
        params.expect(:departure_airport_id),
        params.expect(:arrival_airport_id),
        params.expect(:departure_datetime)
      )
      @passenger_count = params.expect(:passenger_count)
    else
      @flights = nil
    end
  end

  # GET /flights/1 or /flights/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def flight_params
      params.expect(flight: [ :departure_datetime, :arrival_datetime, :departure_airport_id, :arrival_airport_id ])
    end
end
