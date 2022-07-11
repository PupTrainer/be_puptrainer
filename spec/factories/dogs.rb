FactoryBot.define do
  factory :dog do
    Faker::Config.locale = "en-US"
    name { Faker::Creature::Dog.name }
    breed { Faker::Creature::Dog.breed }
    age { Faker::Number.between(from: 1, to: 15) }
    user_id { Faker::Number.between(from: 1, to: 10) }
  end
end
