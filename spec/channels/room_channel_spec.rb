require 'rails_helper'

describe RoomChannel, type: :channel do
  it 'subscribes to a stream when room id is provided' do
    stub_connection user_id: 1
    create(:room, id: 1)
    allow_any_instance_of(RoomChannel).to receive(:params).and_return({ room: 1 })
    subscribe(room_id: 1)

    expect(subscription).to be_confirmed
    expect(streams).to be_truthy
  end
end
