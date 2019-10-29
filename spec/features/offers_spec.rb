require 'rails_helper'

describe 'As a user' do
  describe 'when I visit another users profile' do
    it 'I can open an offer with that user' do
      me = create(:user)
      them = create(:user)
      event = create(:event)
      room = create(:room, event_id: event.id)
      rm = create(:room_message, user: them, room: room)

      visit login_path

      fill_in 'Email', with: me.email
      fill_in 'Password', with: me.password
      click_on 'Log in'

      visit user_show_path(them.username)

      save_and_open_page

      within '.user-events' do
        expect(page).to have_link("Make #{them.username} an offer for #{event.name}")
      end

      click_on "Make an offer"

      expect(current_path).to eq(new_offer_path(them.username, me.username))

      select 2, from: 'Quantity requested'
      fill_in 'Price', with: 100
      fill_in 'Notes', with: 'Thank You!'
      click_on 'Submit'

      expect(current_path).to eq(user_show_path(them.username))
      expect(page).to have_content "You have submitted an offer to #{them.username}"
    end
  end
end
