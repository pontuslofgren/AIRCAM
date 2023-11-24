class AvailabilitiesController < ApplicationController
  def new
    @availability = Availability.new
    @availabilities = Availability.where(camera_id: params[:id])
    @blocked_dates = Camera.find(params[:id]).blocked_dates
  end

  def create
    permitted_params = availability_params
    dates = permitted_params[:start_date].split(" to ")
    start_date = dates[0]
    end_date = dates[1]

    @availability = Availability.new(start_date: start_date, end_date: end_date)
    @availability.camera_id = params[:id]
    if @availability.save
      redirect_to new_availability_path(params[:id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def availability_params
    params.require(:availability).permit(:start_date)
  end
end
