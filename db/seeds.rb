# frozen_string_literal: true

require 'faker'

100.times do
  User.create(
    name: Faker::Name.name,
    age: Faker::Number.between(from: 18, to: 65),
    location: Faker::Address.city,
    phone_number: Faker::PhoneNumber.unique.cell_phone,
    last_visited_at: Faker::Time.between(from: 1.month.ago, to: Time.zone.today)
  )
end
