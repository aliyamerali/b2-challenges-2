require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it {should have_many :assignments}
    it {should have_many(:mechanics).through(:assignments)}
    it {should belong_to :park}
  end

  describe 'class methods' do
    it '.open_by_thrill returns open rides ordered by thrill' do
      @park = Park.create!(name: "Six Flags", admission_price: 49.99 )
      @thunder = Ride.create!(name: "Rolling Thunder", thrill_rating: 10, open: false, park: @park)
      @cups = Ride.create!(name: "Tea Cups", thrill_rating: 3, open: true, park: @park)
      @devil = Ride.create!(name: "Tazmanian Devil", thrill_rating: 6, open: true, park: @park)

      expect(Ride.open_by_thrill.first).to eq(@devil)
      expect(Ride.open_by_thrill.last).to eq(@cups)
    end
  end
end
