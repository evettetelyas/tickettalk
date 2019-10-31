require 'rails_helper'

describe 'As a user' do
  it 'Trying to visit an unknown path with redirect home and display a flash' do
    visit '/pickles'

    expect(page).to have_content("Sorry the page your looking for doesn't exsist")
  end
end
