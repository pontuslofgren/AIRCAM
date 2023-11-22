class AvailabilitiesController < ApplicationController
  def new
    @availability = Availability.new
  end

  def create
    @availability = Availability.new(availability_params)
    @availability.camera_id = params[:id]
    if @availability.save
      redirect_to new_availability_path(params[:id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def availability_params
    params.require(:availability).permit("start_date(1i)", "start_date(2i)", "start_date(3i)", "end_date(1i)", "end_date(2i)", "end_date(3i)")
  end
end
