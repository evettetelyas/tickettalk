# frozen_string_literal: true

require 'rails_helper'

describe 'My Events Index Page' do
  it 'a logged in user can click on My Events and see a page of all the events they have conversed in' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    room_1 = create(:room)
    room_2 = create(:room)
    room_3 = create(:room)
    message_1 = create(:room_message, room: room_1, user: user)
    message_2 = create(:room_message, room: room_2, user: user)
    message_3 = create(:room_message, room: room_3, user: user)
    message_4 = create(:room_message, room: room_3, user: user)

    visit '/events'

    expect(current_path).to eq(my_events_path)
    expect(page).to have_content(room_1.name)
    expect(page).to have_content(room_2.name)
    expect(page).to have_content(room_3.name)
  end
end
