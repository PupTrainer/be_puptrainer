require 'rails_helper'

module Mutations
  RSpec.describe CreateDog, type: :request do
    before :each do 
      @user = create(:user)
    end 

    describe '.resolve' do
      it 'creates a dog' do
        expect(Dog.count).to eq(0)
        
        post '/graphql', params: { query: query }
        json = JSON.parse(response.body, symbolize_names: true)
        data = json[:data][:createDog]

        expect(data[:name]).to be_a String
        expect(data[:age]).to be_a Integer
        expect(data[:breed]).to be_a String
        expect(data[:user]).to be_a Hash
        expect(Dog.count).to eq(1)
      end

      it 'returns an error message if dog name is missing' do 
       
        post "/graphql", params: { query: missing_dog_name }

        json = JSON.parse(response.body, symbolize_names: true)
        data = json[:errors]

        expect(data[0][:message]).to eq("One or more required inputs missing. Please double check and try again")

      end
      def query
        <<~GQL
                mutation {
                  createDog(input: {

                    name: "Cujo"
                    age: 2
                    breed: "Saint Bernard"
                    userId: #{@user.id}
                  })  {
                      id
                      name
                      age
                      breed
                      user {
            id
            username
            email
              }
            }
          }
        GQL
      end

      def missing_dog_name
        <<~GQL
                mutation {
                  createDog(input: {

                    name: null
                    age: 2
                    breed: "Saint Bernard"
                    userId: #{@user.id}
                  })  {
                      id
                      name
                      age
                      breed
                      user {
            id
            username
            email
              }
            }
          }
        GQL
      end
    end
  end
end
