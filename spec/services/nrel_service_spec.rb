require 'rails_helper'

RSpec.describe NRELService do
  context "#get_station_json" do
    it "with zip_code" do
      nrel_service = NRELService.new(zip_code: "80203")
      json = nrel_service.get_station_json
      result = JSON.parse(json)

      expect(json).to_not be(nil)
      expect(json).to_be instance_of(String)
      expect(result.count).to eq(10)
    end
  end
end
