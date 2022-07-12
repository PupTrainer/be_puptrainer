FactoryBot.define do
  factory :dog do
    Faker::Config.locale = "en-US"
    name { Faker::Creature.Dog.name }
    breed { Faker::Creature.Dog.breed }
    age { Faker::Number.number.between(from: 1, to: 15) }
  end
end
