module Mutations
  class AddUser < Mutations::BaseMutation
    argument :params, Types::Input::UserInputType, required: true

    field :user, Types::UserType, null: false

    def resolve(params:)
      user_params = Hash params

      begin
        new_user = User.create!(user_params)

        { note: note }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end