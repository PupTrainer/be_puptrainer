require 'rails_helper'

module Queries
  RSpec.describe FetchUser, type: :request do 
    describe '.resolve' do 
      before do
        @user1 = User.create!(username: 'lron_hubbard', email: 'lron@spaghetti.com')
        @dog1 = Dog.create!(name: "Tim Cruise", age: 6, breed: 'Dachshund', user_id: @user1.id)
        @dog2 = Dog.create!(name: "50 Cent", age: 2, breed: 'German Shorthair Pointer', user_id: @user1.id) 
        @user2 = User.create!(username: 'new_shoes', email: 'cool@shoes.com')  
        @skill1 = Skill.create!(name: "Sit", level: 1, description: 'Step 1. Get your dogs attention with a treat. 2. While raising your hand upwards, say "sit". 3. Your dog should sit and look at you. 4. Reward your dog with the treat.', criteria: "Your dog should sit right as you are saying the command, and stay sitting until you release them", youtube_link: "https://www.youtube.com/watch?v=EDgi2sLlWAU")
        @dogskill1 = DogSkill.create!(dog_id: @dog1.id, skill_id: @skill1.id)
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

      it 'returns a user and any dogs with their skills from a given ID' do 
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
        expect(dogs[0]).to have_key(:skills)
        expect(dogs[0][:skills]).to be_a Array
        expect(dogs[0][:skills][0]).to have_key(:name)
        expect(dogs[0][:skills][0]).to have_key(:level)
        expect(dogs[0][:skills][0]).to have_key(:description)
        expect(dogs[0][:skills][0]).to have_key(:criteria)
        expect(dogs[0][:skills][0]).to have_key(:youtubeLink)
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

      it 'allows for using email in fetchUser to find a user' do
        post '/graphql', params: { query: query_by_email }
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

    end
    ## query methods for graphQL post reqests
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
              skills {
                id
                name
                level
                description
                criteria
                youtubeLink
              }
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

    def query_by_email
      <<~GQL
        query {
          fetchUser(email: "#{@user1.email}"){
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
