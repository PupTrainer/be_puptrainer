require 'rails_helper'

module Mutations
  RSpec.describe CreateDog, type: :request do
    describe '.resolve' do
      it 'creates a dog' do
        expect(Dog.count).to eq(0)
        user = create_list(:user, 2)
        # dog = create(:dog, {user_id: user.id})

        post '/graphql', params: { query: query }
        json = JSON.parse(response.body, symbolize_names: true)
        data = json[:data][:createDog]

        expect(data[:name]).to be_a String

        expect(data[:age]).to be_a Integer

        expect(data[:breed]).to be_a String

        expect(data[:user]).to be_a Hash
        expect(Dog.count).to eq(1)
      end
      def query
        <<~GQL
                mutation {
                  createDog(input: {

                    name: "Cujo"
                    age: 2
                    breed: "Saint Bernard"
                    userId: 2
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
