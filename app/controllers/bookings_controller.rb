class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @bookings = Booking.where(renter_id: current_user.id)
  end

  def new
    @booking = Booking.new
  end

  def create
    permitted_params = booking_params
    dates = permitted_params[:start_date].split(" to ")

    @booking = Booking.new(start_date: dates[0], end_date: dates[1], )
    @booking.camera_id = params[:id]
    @booking.renter_id = current_user.id
    if @booking.save
      redirect_to my_bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @bookings = Booking.where(renter_id: current_user.id)
  end

  def confirm
    @booking = Booking.find(params[:id])
    @booking.booked = true
    @booking.save
    redirect_to camera_path(@booking.camera)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to camera_path(@booking.camera)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date)
  end
end
