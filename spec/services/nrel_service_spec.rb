require 'rails_helper'

RSpec.describe NRELService do
  context "#get_station_json" do
    it "with zip_code" do
      nrel_service = NRELService.new(location: "80203", radius: "6.0", limit: "10")
      response = nrel_service.get_station_json
      result = JSON.parse(response.body)

      expect(response.body).to_not be(nil)
      expect(result.count).to eq(10)
    end
  end
end
