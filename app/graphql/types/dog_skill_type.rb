# frozen_string_literal: true

module Types
    class DogSkillType < Types::BaseObject
      field :id, ID, null: false
      field :skill_id, Integer, null: false
      field :dog_id, Integer, null: false
      field :status, Boolean
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    end
  end
  