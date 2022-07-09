module Types
  module Input
    class UserInputType < Types::BaseInputObject
      argument :id, Integer, required: true
      argument :username, String, required: true
      argument :email, String, required: true
      argument :created_at, GraphQL::Types::ISO8601DateTime
      argument :updated_at, GraphQL::Types::ISO8601DateTime
      argument :user_dogs, Array, required: true
      def user_dogs
        User.find(:id).dogs
      end 
    end 
  end 
end 