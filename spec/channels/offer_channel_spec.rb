require 'rails_helper'

describe OfferChannel, type: :channel do
  it 'subscribes to a stream for a user' do
    create(:user, id: 1)
    allow_any_instance_of(OfferChannel).to receive(:params).and_return({ user: 1 })
    subscribe

    expect(subscription).to be_confirmed
    expect(streams).to be_truthy
  end
end
