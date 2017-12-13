class SearchController < ApplicationController

  def index
    nrel_service = NRELService.new(zip_code: params[:zip_code])
    stations = nrel_service.get_stations
    @station_decorator = StationDecorator.new(stations, zip_code: params[:zip_code])
  end

end
