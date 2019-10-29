# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { Faker::TvShows::AquaTeenHungerForce.character }
    tm_id  { FactoryBot.generate(:random_id) }
    purchase_url  { FactoryBot.generate(:random_id) }
    on_sale  { Time.now - 3.days }
    date  { Time.now }
    raw_date { Time.new.to_s }
    price_min { 10.0 }
    price_max { 100.00 }
    currency { 'USD' }
    seatmap { 'seatmap' }
    limit { rand(1..10).to_s }
    venue { 'Fake Venue' }
  end
end
