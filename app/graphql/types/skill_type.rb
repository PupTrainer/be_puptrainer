# frozen_string_literal: true

module Types
  class SkillType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :level, Integer
    field :description, String
    field :criteria, String
    field :youtube_link, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
