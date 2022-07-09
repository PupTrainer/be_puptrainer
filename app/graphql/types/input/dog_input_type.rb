module Types
  module Input
    class DogInputType < Types::BaseInputObject
      argument :id, Integer, required: true
      argument :name, String, required: true
      argument :age, Integer, required: true
      argument :breed, String, required: true
      argument :user_id, Integer, required: true

      argument :created_at, GraphQL::Types::ISO8601DateTime
      argument :updated_at, GraphQL::Types::ISO8601DateTime
   
    end 
  end 
end 