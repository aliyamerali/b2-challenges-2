require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it {should have_many :assignments}
    it {should have_many(:mechanics).through(:assignments)}
  end
end
