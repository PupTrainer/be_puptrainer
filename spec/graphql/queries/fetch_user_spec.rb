require 'rails_helper'

module Queries
  RSpec.describe FetchUser, type: :request do 
    describe '.resolve' do 
      it 'returns a user with any dogs they have' do 
        user1 = User.create!(username: 'lron_hubbard', email: 'lron@spaghetti.com')
        dog1 = Dog.create!(name: "Tim Cruise", age: 6, breed: 'Dachshund', user_id: user1.id)
        dog2 = Dog.create!(name: "50 Cent", age: 2, breed: 'German Shorthair Pointer', user_id: user1.id)
        
        post '/graphql', params: { query: query }
        json = JSON.parse(response.body, symbolize_names: true)
        data = json[:data][:fetchUser]
        expect(data).to be_a Hash
      end
    end

    def query
      <<~GQL
        query {
          fetchUser(id: 1){
            id
            username
            email
            dogs {
              id
              name
              age
              breed
            }
          }
        }
      GQL
    end 
  end
end
