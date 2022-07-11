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
    field :user, Types::UserType, null: true
    def user
      user = User.find(self.object.user_id)
      user
    end 
  end
end
