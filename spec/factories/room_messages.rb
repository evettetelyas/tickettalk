FactoryBot.define do
	factory :room_message do
	  message { Faker::Quote.robin }
	  room { room }
	  user { user }
	end
  end