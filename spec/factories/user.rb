FactoryBot.define do
  factory :user do
    Faker::Config.locale = "en-US"
    username { Faker::Internet.unique.username }
    email { Faker::Internet.email }
  end
end
