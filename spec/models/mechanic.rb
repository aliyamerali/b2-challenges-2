require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it {should have_many :assignments}
    it {should have_many(:rides).through(:assignments)}
  end
end
