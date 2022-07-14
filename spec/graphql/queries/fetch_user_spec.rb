require 'rails_helper'

module Queries
  RSpec.describe FetchUser, type: :request do 
    describe '.resolve' do 
      before do
        @user1 = User.create!(username: 'lron_hubbard', email: 'lron@spaghetti.com')
        @dog1 = Dog.create!(name: "Tim Cruise", age: 6, breed: 'Dachshund', user_id: @user1.id)
        @dog2 = Dog.create!(name: "50 Cent", age: 2, breed: 'German Shorthair Pointer', user_id: @user1.id) 
        @user2 = User.create!(username: 'new_shoes', email: 'cool@shoes.com')  
      end

      it 'returns a user from a given ID' do 
        post '/graphql', params: { query: query }
        json = JSON.parse(response.body, symbolize_names: true)
        data = json[:data][:fetchUser]
        expect(data).to be_a Hash
        expect(data).to have_key(:id)
        expect(data[:id]).to be_a String
        
        expect(data).to have_key(:username)
        expect(data[:username]).to be_a String
        expect(data[:username]).to eq(@user1.username)
        
        expect(data).to have_key(:email)
        expect(data[:email]).to be_a String
        expect(data[:email]).to eq(@user1.email)
        
        expect(data).to have_key(:dogs)
        expect(data[:dogs]).to be_an Array
      end

      it 'returns a user and any dogs they have from a given ID' do 
        post '/graphql', params: { query: query }
        json = JSON.parse(response.body, symbolize_names: true)
        dogs = json[:data][:fetchUser][:dogs]
        expect(dogs).to be_an Array
        expect(dogs.count).to eq(2)
        dogs.each do |dog|
          expect(dog).to have_key(:id)
          expect(dog[:id]).to be_a String

          expect(dog).to have_key(:name)
          expect(dog[:name]).to be_a String

          expect(dog).to have_key(:age)
          expect(dog[:age]).to be_an Integer

          expect(dog).to have_key(:breed)
          expect(dog[:breed]).to be_a String
        end 
        expect(dogs.first[:name]).to eq(@dog1.name)
        expect(dogs.last[:name]).to eq(@dog2.name)
      end

      it 'returns an empty dog array if user has no dogs' do
        post '/graphql', params: { query: query_no_dogs }
        json = JSON.parse(response.body, symbolize_names: true)
        json = JSON.parse(response.body, symbolize_names: true)
        data = json[:data][:fetchUser]

        expect(data[:dogs]).to be_an Array
        expect(data[:dogs].empty?).to eq(true)
        expect(data[:dogs].count).to eq(0)

      end 

    end

    def query
      <<~GQL
        query {
          fetchUser(id: #{@user1.id}){
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

    def query_no_dogs
      <<~GQL
        query {
          fetchUser(id: #{@user2.id}){
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
