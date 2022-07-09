# module Mutations
#   module Dogs
#     class CreateDog < ::Mutations::BaseMutation
class Mutations::CreateDog < Mutations::BaseMutation
      argument :name, String, required: true
      argument :age, Integer, required: true
      argument :breed, String, required: true
      argument :user_id, Integer, required: true
      type Types::DogType
      
      def resolve(user_id:, **attributes)
        # binding.pry
        user = User.find(user_id)
        dog = User.find(user_id).dogs.create!(attributes)
        dog
      end
  #   end
  # end
end