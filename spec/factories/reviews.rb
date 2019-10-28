FactoryBot.define do
  factory :review do
    reviewer { user }
    user { user }

    rating { rand(1..5) }
    content { Faker::TvShows::GameOfThrones.quote }
  end
end
