class CamerasController < ApplicationController

  def index
    @cameras = Camera.paginate(page: params[:page], per_page: 6)
  end

  def new
    @camera = Camera.new
  end

  def create
    @camera = Camera.new(camera_params)
    @camera.owner_id = current_user.id
    if @camera.save
      redirect_to camera_path(@camera)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @camera = Camera.find(params[:id])
    @booking = Booking.new()
    @blocked_dates = @camera.blocked_dates
  end

  def edit
    @camera = Camera.find(params[:id])
  end

  def update
    @camera = Camera.find(params[:id])
    if @camera.update(camera_params)
      redirect_to camera_path(@camera)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @camera = Camera.find(params[:id])
    @camera.destroy
    redirect_to profile_path(current_user)
  end

  private

  def camera_params
    params.require(:camera).permit(:title, :description, :brand, :location, :price, photos: [])
  end
end
