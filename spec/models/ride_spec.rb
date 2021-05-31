require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it {should have_many :assignments}
    it {should have_many(:mechanics).through(:assignments)}
  end

  describe 'class methods' do
    it '.open_by_thrill returns open rides ordered by thrill' do
      @thunder = Ride.create!(name: "Rolling Thunder", thrill_rating: 10, open: false)
      @cups = Ride.create!(name: "Tea Cups", thrill_rating: 3, open: true)
      @devil = Ride.create!(name: "Tazmanian Devil", thrill_rating: 6, open: true)

      expect(Ride.open_by_thrill.first).to eq(@devil)
      expect(Ride.open_by_thrill.last).to eq(@cups)
    end
  end
end
