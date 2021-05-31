require 'rails_helper'

RSpec.describe 'Mechanics Index page' do
  before :each do
    @mech_1 = Mechanic.create!(name: "Salty Sal", years_experience: 12)
    @mech_2 = Mechanic.create!(name: "Tough Tony", years_experience: 23)
    @mech_3 = Mechanic.create!(name: "Lucky Lucy", years_experience: 8)

    visit '/mechanics'
  end

  it 'has header' do
    expect(page).to have_content("All Mechanics")
  end

  it 'Lists all mechanics names and years experience' do
    expect(page).to have_content(@mech_1.name)
    expect(page).to have_content(@mech_1.years_experience)
    expect(page).to have_content(@mech_2.name)
    expect(page).to have_content(@mech_2.years_experience)
    expect(page).to have_content(@mech_3.name)
    expect(page).to have_content(@mech_3.years_experience)
  end

  it 'shows avg years experience across all mechanics' do
    expect(page).to have_content("Average years experience: 14")
  end
end
