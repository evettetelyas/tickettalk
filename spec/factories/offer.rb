# frozen_string_literal: true

FactoryBot.define do
  factory :offer do
    user { user }
    offer_user { user }
    quantity_requested { 2 }
    offer_price { rand(10..500) }
    notes { Faker::TvShows::GameOfThrones.quote }
  end
end
