class Mutations::CreateUser < Mutations::BaseMutation
  argument :username, String, required: true
  argument :email, String, required: true

  field :user, Types::UserType, null: false
  field :errors, [String], null: false
  
  def resolve(username:, email:)
    # binding.pry
    if user = User.find_or_create_by!(username: username, email: email)

    # if user.save
      { user: user, errors: [] }
    else
      { user: nil, errors: user.errors.full_messages }
    end
  end
end



# module Mutations
#   class AddUser < Mutations::BaseMutation
#     argument :params, Types::Input::UserInputType, required: true

#     field :user, Types::UserType, null: false

#     def resolve(params:)
#       binding.pry
#       user_params = Hash params

#       begin
#         new_user = User.create!(user_params)
#         new_user.save
#         { user: new_user }
#       rescue ActiveRecord::RecordInvalid => e
#         GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
#           " #{e.record.errors.full_messages.join(', ')}")
#       end
#     end
#   end
# end