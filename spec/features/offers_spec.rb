require 'rails_helper'

describe 'As a user' do
  describe 'when I visit another users profile' do
    before :each do
      @me = create(:user)
      @them = create(:user)
      @event = create(:event, limit: 10)
      @room = create(:room, event_id: event.id)
      @rm = create(:room_message, user: @them, room: @room)
    end
    it 'I can open an offer with that user' do

      visit login_path

      fill_in 'Email', with: @me.email
      fill_in 'Password', with: @me.password
      click_on 'Log in'

      visit user_show_path(@them.username)

      within '.user-events' do
        expect(page).to have_link("Make an offer")
      end

      click_on "Make an offer"

      expect(current_path).to eq(new_offer_path(@them.id, @me.id))

      select 2, from: 'Quantity requested'
      fill_in 'Offer price', with: 100
      fill_in 'Notes', with: 'Thank You!'
      click_on 'Save Offer'

      expect(current_path).to eq(user_show_path(@them.username))
      expect(page).to have_content "You have submitted an offer"
    end

    it 'user can accept or decline pending offers' do
      new_offer = 
    end
  end
end
