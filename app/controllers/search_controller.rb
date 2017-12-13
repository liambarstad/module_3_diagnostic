class SearchController < ApplicationController

  def index
    stations = Station.get_by(location: params[:search])
    @station_decorator = StationDecorator.new(stations, zip_code: params[:zip_code])
  end

end
