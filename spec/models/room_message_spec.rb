require 'rails_helper'

describe RoomMessage do
  describe 'instance methods' do
    it 'as_json merges hases to be rendered into json' do
      user = create(:user)
      room = create(:room)
      rm = create(:room_message, room: room, user: user)
      options = {
        fake_hash: 'fake string'
      }
      expect(rm.as_json(options)['message']).to eq(rm.message)
    end
  end
end
