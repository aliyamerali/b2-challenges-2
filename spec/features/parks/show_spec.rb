require 'rails_helper'

RSpec.describe 'Park Show page' do
  before :each do
    @park = Park.create!(name: "Six Flags", admission_price: 49.99 )
    @cups = Ride.create!(name: "Tea Cups", thrill_rating: 3, open: true, park: @park)
    @devil = Ride.create!(name: "Tazmanian Devil", thrill_rating: 6, open: true, park: @park)
    @thunder = Ride.create!(name: "Rolling Thunder", thrill_rating: 10, open: false, park: @park)

    visit "/parks/#{@park.id}"
  end

  it 'shows the name and price of admission for the park' do
    expect(page).to have_content(@park.name)
    expect(page).to have_content(@park.admission_price)
  end

  it 'Shows all the rides at the park listed in in alphabetical order' do
    expect(@thunder.name).to appear_before(@devil.name)
    expect(@devil.name).to appear_before(@cups.name)
  end

  it 'Shows the average thrill rating of all rides at the park' do
    expect(page).to have_content("Average Thrill Rating of Rides: 6.33")
  end
end
