class CamerasController < ApplicationController

  def index
    @cameras = Camera.paginate(page: params[:page], per_page: 6)
    if params[:query].present?
      @cameras = Camera.search_full_text(params[:query]).paginate(page: params[:page], per_page: 6)
    end
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
