require 'rails_helper'

RSpec.describe "ticketmaster discovery api service" do
    it "returns events from search endpoint" do
        service = DiscoService.new
        data = service.search_events("phish")
		events = data[:events]

		expect(events.first).to have_key(:name)
		expect(events.first).to have_key(:id)
		expect(events.first).to have_key(:purchase_url)
		expect(events.first).to have_key(:image)
		expect(events.first).to have_key(:date)
		expect(events.first).to have_key(:price_min)
		expect(events.first).to have_key(:price_max)
		expect(events.first).to have_key(:currency)
		expect(events.first).to have_key(:seatmap)
		expect(events.first).to have_key(:limit)
		expect(events.first).to have_key(:venue)
    end
end