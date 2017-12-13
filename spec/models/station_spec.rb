require 'rails_helper'

RSpec.describe Station do
  context "class methods" do
    it "can make stations from nrel service" do
      stations = Station.get_by(location: "80203")

      expect(stations).to be_instance_of(Array)
      expect(stations[0]).to be_instance_of(Station)
      expect(stations.count).to eq(10)
    end
  end
end
