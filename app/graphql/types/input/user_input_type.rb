module Types
  module Input
    class UserInputType < Types::BaseInputObject
      argument :id, Tnteger, required: true
      argument :username, String, required: true
      argument :email, String, required: true
    end 
  end 
end 