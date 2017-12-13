require 'rails_helper'

RSpec.feature "user can search stations" do
  it "with main page search bar" do
    visit "/"
    fill_in "search", with: "80203"
    save_and_open_page
    click_on "Locate"

    expect(current_path).to eq('/search')
    expect(page).to have_css('.station', count: 10)
    expect(page).to have_css('.station-name', count: 10)
    expect(page).to have_css('.station-address', count: 10)
    expect(page).to have_css('.station-fuel-type', count: 10)
    expect(page).to have_css('.station-distance', count: 10)
    expect(page).to have_css('.station-access-times', count: 10)
    expect(page).to_not have_css('.station-fuel-type', text: '') #stations other than electric/propane
    expect(page).to_not have_css('.station-fuel-type', text: '')
  end
end
