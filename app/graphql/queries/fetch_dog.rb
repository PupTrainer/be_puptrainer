module Queries
  class FetchDog < Queries::BaseQuery
    type Types::DogType, null: false
    argument :id, ID, required: true

    def resolve(id:)
      # binding.pry
      dog = Dog.find(id.to_i)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('Dog does not exist.')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end