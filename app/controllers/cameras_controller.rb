class CamerasController < ApplicationController

  def index
  end

  def new
    @camera = Camera.new
  end
end
