class Mutations::CreateUser < Mutations::BaseMutation
  argument :username, String, required: true
  argument :email, String, required: true

  field :user, Types::UserType
  field :dogs, Types::DogType, null: false
  field :errors, [String], null: false

  def resolve(username:, email:)
    begin 
    user = User.find_or_create_by(username: username, email: email)
      {user: user, errors: []}
    
    rescue ActiveRecord::ValidationFailed => _e
    GraphQL::ExecutionError.new("Username has been taken.")
    end
  end
end
