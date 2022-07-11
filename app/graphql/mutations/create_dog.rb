class Mutations::CreateDog < Mutations::BaseMutation
  argument :name, String, required: true
  argument :age, Integer, required: true
  argument :breed, String, required: true
  argument :user_id, Integer, required: true
  type Types::DogType

  def resolve(user_id:, **attributes)
    user = User.find(user_id)
    User.find(user_id).dogs.create!(attributes)
  end
end
