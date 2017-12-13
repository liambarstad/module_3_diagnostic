class SearchController < ApplicationController

  def index
    stations = Station.get_by(zip_code: params[:zip_code])
    @station_decorator = StationDecorator.new(stations, zip_code: params[:zip_code])
  end

end
