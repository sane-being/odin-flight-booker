class BookingsController < ApplicationController
  before_action :set_flight
  before_action :set_booking, only: %i[ show destroy ]


  def index
    @bookings = @flight.bookings
  end

  def show
  end

  def new
    @booking = @flight.bookings.build

    @passenger_count = params.expect(:passenger_count).to_i
    @passenger_count.times { @booking.passengers.build }
  end

  def create
    @booking = @flight.bookings.build(booking_params)

    if @booking.save
      redirect_to flight_booking_path(@flight, @booking), notice: "Booking was successfully created."
    else
      render :new
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy!

    respond_to do |format|
      format.html { redirect_to flights_path, status: :see_other, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.expect(booking: [ passengers_attributes: [ [ :name, :email ] ] ])
    end

    def set_flight
      @flight = Flight.find(params.expect(:flight_id))
    end
end
