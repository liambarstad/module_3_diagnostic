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
    response = nrel_service.get_station_json
    binding.pry

  end

end
