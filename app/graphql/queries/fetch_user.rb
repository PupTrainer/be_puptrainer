module Queries
  class FetchUser < Queries::BaseQuery
    type Types::UserType, null: false
    argument :id, ID, required: true

    def resolve(id:)
      binding.pry
      user = User.find(id.to_i)
      # dogs = user.dogs
      # {user: user, dogs: dogs}
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('User does not exist.')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end