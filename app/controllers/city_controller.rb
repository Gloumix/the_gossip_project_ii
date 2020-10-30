class CityController < ApplicationController
  def show
    @cityfind = City.find(params[:id])
  end
end