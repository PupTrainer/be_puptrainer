FactoryBot.define do
  factory :dog do
    Faker::Config.locale = "en-US"
<<<<<<< aw_dev_branch
    name { Faker::Creature::Dog.name }
    breed { Faker::Creature::Dog.breed }
    age { Faker::Number.between(from: 1, to: 15) }
    user_id { Faker::Number.between(from: 1, to: 10) }
=======
    name { Faker::Creature.Dog.name }
    breed { Faker::Creature.Dog.breed }
    age { Faker::Number.number.between(from: 1, to: 15) }
>>>>>>> main
  end
end
