class Station

  def initialize(params)
    @name = params[:name]
    @address = params[:address]
    @fuel_type = params[:fuel_type]
    @distance = params[:distance]
    @access_times = params[:access_times]
  end

  def self.get_by(args)
    nrel_service = NRELService.new(args)
    response = JSON.parse(nrel_service.get_station_json.body)
    stations = response["fuel_stations"]
    stations.map do |station_info|
      from_nrel_info(station_info)
    end
  end

  def self.from_nrel_info(station_info)
    new(name: station_info["station_name"], 
        fuel_type: station_info["fuel_type_code"],
        address: (station_info["street_address"] + ", " + station_info["city"] + ", " + station_info["state"]),
        distance: station_info["distance"],
        access_times: station_info["access_days_time"])
  end

end
