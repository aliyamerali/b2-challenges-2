require 'rails_helper'

RSpec.describe 'Mechanic show page' do
  before :each do
    @mech_1 = Mechanic.create!(name: "Salty Sal", years_experience: 12)
    @mech_2 = Mechanic.create!(name: "Tough Tony", years_experience: 23)

    @park = Park.create!(name: "Six Flags", admission_price: 49.99 )
    @log_flume = @park.rides.create!(name: "Log flume", thrill_rating: 5, open: true)
    @thunder = @park.rides.create!(name: "Rolling Thunder", thrill_rating: 10, open: false)
    @cups = @park.rides.create!(name: "Tea Cups", thrill_rating: 3, open: true)
    @devil = @park.rides.create!(name: "Tazmanian Devil", thrill_rating: 6, open: true)

    @mech_1.rides << @log_flume
    @mech_1.rides << @thunder
    @mech_2.rides << @cups
    @mech_2.rides << @devil
  end

   it "shows the mechanics name, years experience" do
     visit "/mechanics/#{@mech_1.id}"
     expect(page).to have_content(@mech_1.name)
     expect(page).to have_content(@mech_1.years_experience)

     visit "/mechanics/#{@mech_2.id}"
     expect(page).to have_content(@mech_2.name)
     expect(page).to have_content(@mech_2.years_experience)
   end

   it "shows the open rides the mechanic is working on" do
     visit "/mechanics/#{@mech_1.id}"
     expect(page).to have_content(@log_flume.name)
     expect(page).to_not have_content(@thunder.name)

     visit "/mechanics/#{@mech_2.id}"
     expect(page).to have_content(@cups.name)
     expect(page).to have_content(@devil.name)
   end

   it "shows rides in order of thrill rating - highest to lowest" do
     visit "/mechanics/#{@mech_2.id}"
     expect(@devil.name).to appear_before(@cups.name)
   end

   it 'has a form to add a ride to the workload for the mechanic' do
     visit "/mechanics/#{@mech_2.id}"
     expect(page).to have_field("Ride ID:")
   end

   it 'upon submitting a ride id, returns to the show page with that ride listed' do
     visit "/mechanics/#{@mech_2.id}"
     fill_in 'Ride ID:', with: "#{@log_flume.id}"
     click_button 'Add Ride'

     expect(page).to have_current_path("/mechanics/#{@mech_2.id}")
     expect(page).to have_content(@log_flume.name)
   end


end
