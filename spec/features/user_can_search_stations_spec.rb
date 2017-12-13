And I fill in the search form with 80203
And I click "Locate"
Then I should be on page "/search" with parameters visible in the url
Then I should see a list of the 10 closest stations within 6 miles sorted by distance
And the stations should be limited to Electric and Propane
And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times

require 'rails_helper'

RSpec.feature "user can search stations" do
  it "with main page search bar" do
    visit "/"
    fill_in "search", with: "80203"
    click_on "Locate"

    expect(current_path).to eq('/search')
    expect(page).to have_css('.station', count: 10)
    expect(page).to have_css('.station-name', count: 10)
    expect(page).to have_css('.station-address', count: 10)
    expect(page).to have_css('.station-fuel-type', count: 10)
    expect(page).to have_css('.station-distance', count: 10)
    expect(page).to have_css('.station-access-times', count: 10)
  end
end
