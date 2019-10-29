require 'rails_helper'

describe 'As a user' do
  describe 'when I visit another users profile' do
    it 'I can open an offer with that user' do
      me = create(:user)
      them = create(:user)

      visit login_path

      fill_in 'Email', with: me.email
      fill_in 'Password', with: me.password
      click_on 'Log in'

      visit user_show_path(them.username)

      expect(page).to have_link("Make an offer for #{them.username}")

      click_on "Make an offer for #{them.username}"

      expect(current_path).to eq(new_offer_path)

      select 2, from: 'Tickets Requested'
      fill_in 'Price', with: 100
      fill_in 'Notes', with: 'Thank You!'
      click_on 'Submit'

      expect(current_path).to eq(user_show_path(them.username))
      expect(page).to have_content "You have submitted an offer to #{them.username}"
    end
  end
end
