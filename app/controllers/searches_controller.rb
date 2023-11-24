class SearchesController < ApplicationController
  def new
  end

  def search
    @results = YourModel.where("name LIKE ?", "%#{params[:query]}%")
  end
end
