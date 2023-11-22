class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.camera_id = params[:id]
    @booking.renter_id = current_user.id
    if @booking.save
      redirect_to user_bookings_path(current_user.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @bookings = Booking.where(renter_id: current_user.id)
  end

  private

  def booking_params
    params.require(:booking).permit("start_date(1i)", "start_date(2i)", "start_date(3i)", "end_date(1i)", "end_date(2i)", "end_date(3i)")
  end
end
