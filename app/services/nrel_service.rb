class NRELService

  def initialize(params)
    @location = params[:zip_code]
  end

  def get_station_json
    station_connection.get('/nearest') do |f|
      set_params(f)
    end
  end

  private

    def station_connection
      Faraday.new('https://developer.nrel.gov/api/alt-fuel-stations/v1') do |f|
        f.params['format'] = 'json'
        f.params['api_key'] = ENV['NREL_API_KEY']
      end
    end

    def set_params(faraday_object)
      instance_values.each do |name, value|
        faraday_object.params["#{name}"] = value
      end
    end

end
