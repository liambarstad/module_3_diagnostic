class NRELService

  def initialize(args)
    @location = args[:location]
    @radius = args[:radius] || "6.0"
    @limit = args[:limit] || "10"
  end

  def get_station_json
    station_connection.get('/api/alt-fuel-stations/v1/nearest.json') do |f|
      set_params(f)
    end
  end

  private

    def station_connection
      Faraday.new('https://developer.nrel.gov') do |f|
        f.params['format'] = 'json'
        f.params['api_key'] = ENV['NREL_API_KEY']
        f.adapter Faraday.default_adapter
      end
    end

    def set_params(faraday_object)
      instance_values.each do |name, value|
        faraday_object.params["#{name}"] = value if value
      end
    end

end
