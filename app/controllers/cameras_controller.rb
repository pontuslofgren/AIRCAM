class CamerasController < ApplicationController

  def index
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
  end

  private

  def camera_params
    params.require(:camera).permit(:title, :description, :brand, :location, :price, photos: [])
  end
end
