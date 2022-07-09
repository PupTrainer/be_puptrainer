class Mutations::CreateUser < Mutations::BaseMutation
  argument :username, String, required: true
  argument :email, String, required: true

  field :user, Types::UserType, null: false
  field :errors, [String], null: false
  
  def resolve(username:, email:)
    if user = User.find_or_create_by!(username: username, email: email)
      { user: user, errors: [] }
    else
      { user: nil, errors: user.errors.full_messages }
    end
  end
end


