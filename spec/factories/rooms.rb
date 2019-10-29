# frozen_string_literal: true

FactoryBot.define do
  sequence(:random_id) { |n| @random_ids ||= (1..100_000).to_a.shuffle; @random_ids[n] }

  factory :room do
    name { Faker::TvShows::AquaTeenHungerForce.character }
    tm_id  { FactoryBot.generate(:random_id) }
    event_id { FactoryBot.generate(:random_id) }
  end
end
