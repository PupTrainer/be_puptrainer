module Types
  module Input
    class SkillInputType < Types::BaseInputObject
      argument :id, Integer, required: true
      argument :name, String, required: true
      argument :level, Integer, required: true
      argument :description, String, required: true
      argument :criteria, String, required: true
      argument :youtube_link, String, required: true

      argument :created_at, GraphQL::Types::ISO8601DateTime
      argument :updated_at, GraphQL::Types::ISO8601DateTime
  
    end 
  end 
end 