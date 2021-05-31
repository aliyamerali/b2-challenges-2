require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it {should have_many :assignments}
    it {should have_many(:rides).through(:assignments)}
  end

  describe 'class methods' do
    it '.avg_yrs_exp returns average years experience of all mechanics' do
      Mechanic.create!(name: "Salty Sal", years_experience: 12)
      Mechanic.create!(name: "Tough Tony", years_experience: 23)
      Mechanic.create!(name: "Lucky Lucy", years_experience: 8)

      expect(Mechanic.avg_yrs_exp.floor).to eq(14)
    end
  end
end
