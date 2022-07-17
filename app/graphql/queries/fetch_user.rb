module Queries
  class FetchUser < Queries::BaseQuery
    type Types::UserType, null: false
    argument :id, ID, required: false
    argument :email, String, required: false

    def resolve(**args)
      if args[:id]
        id = args[:id].to_i
        user = User.find_by(id: id)
      elsif args[:email]
        user = User.find_by(email: args[:email])
      end  
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new("User does not exist.")
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(", ")}")
    end
  end
end
