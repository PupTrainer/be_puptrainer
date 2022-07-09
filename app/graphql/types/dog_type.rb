# frozen_string_literal: true

module Types
  class DogType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :age, Integer
    field :breed, String
    field :user_id, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :id, ID, null: false
    field :name, String, null: false
    field :age, Integer, null: false
    field :breed, String, null: false
    field :user_id, ID, null: false
  end
end
