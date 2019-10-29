FactoryBot.define do
	sequence(:random_id) {|n| @random_ids ||= (1..100000).to_a.shuffle; @random_ids[n] }
  
	factory :room do
	  name { Faker::TvShows::AquaTeenHungerForce.character }
	  tm_id  { FactoryBot.generate(:random_id) }
	end
  end