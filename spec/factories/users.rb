# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    age { Faker::Number.between(from: 18, to: 65) }
    location { Faker::Address.city }
    phone_number { Faker::PhoneNumber.cell_phone }
    last_visited_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
  end
end
