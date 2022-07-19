module Types
  module Input
    class DogSkillInputType < Types::BaseInputObject
      argument :id, Integer, required: true
      argument :passed, Boolean, required: false
      argument :dog_id, Integer, required: true
      argument :skill_id, Integer, required: true

      argument :created_at, GraphQL::Types::ISO8601DateTime
      argument :updated_at, GraphQL::Types::ISO8601DateTime
    end
  end
end
