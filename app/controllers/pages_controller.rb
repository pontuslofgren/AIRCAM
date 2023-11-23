class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @cameras = Camera.all.sample(6)
  end

  def about
  end

  def show
    @camera = Camera.find(params[:id])
  end
end
