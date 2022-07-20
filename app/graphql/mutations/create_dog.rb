class Mutations::CreateDog < Mutations::BaseMutation
  argument :name, String, required: false
  argument :age, Integer, required: false
  argument :breed, String, required: false
  argument :user_id, Integer, required: true
  type Types::DogType

  def resolve(user_id:, **attributes)
    begin
      user = User.find(user_id)
      dog = User.find(user_id).dogs.create!(attributes)
    
      rescue ActiveRecord::RecordInvalid => _e 
      GraphQL::ExecutionError.new("One or more required inputs missing. Please double check and try again")
    end 
  end
end
