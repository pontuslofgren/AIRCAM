class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @cameras = Camera.all.sample(6)
  end

  def profile
    @user = current_user
    @bookings = Booking.where(renter_id: @user.id)
    @cameras = Camera.where(owner_id: @user.id)
  end

  def about
  end

  def show
    @camera = Camera.find(params[:id])
  end
end
