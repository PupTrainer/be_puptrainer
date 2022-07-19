module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_dog, mutation: Mutations::CreateDog
    field :add_dog_skill, mutation: Mutations::AddDogSkill
    field :pass_dog_skill, mutation: Mutations::PassDogSkill
  end
end
