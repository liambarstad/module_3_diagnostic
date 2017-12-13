class SearchController < ApplicationController

  def index
    binding.pry
    stations = Station.get_by(location: params[:location])
    @station_decorator = StationDecorator.new(stations, zip_code: params[:zip_code])
  end

end
