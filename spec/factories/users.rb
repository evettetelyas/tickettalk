# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Name.first_name }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { Faker::String.random(length: 6..12) }
  end

  factory :admin, parent: :user do
    role { :admin }
  end
end
