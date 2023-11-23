class ProfilesController < ApplicationController
  def show
    # Fetch the user's profile information here
    @current_user = current_user # Replace with your actual logic to fetch the user data
  end
end
