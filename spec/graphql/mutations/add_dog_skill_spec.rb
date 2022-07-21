require 'rails_helper'

module Mutations
  RSpec.describe AddDogSkill, type: :request do
    before :each do
      @user = create(:user)
      @dog = create(:dog, user_id: @user.id)
      @skill = Skill.create!(name: 'Sit', level: 1,
                          description: 'Step 1. Get your dogs attention with a treat. 2. While raising your hand upwards, say "sit". 3. Your dog should sit and look at you. 4. Reward your dog with the treat.', criteria: 'Your dog should sit right as you are saying the command, and stay sitting until you release them', youtube_link: 'https://www.youtube.com/watch?v=EDgi2sLlWAU')
    end 

    describe '.resolve' do
      it 'returns a dog_skill ' do
      

        post '/graphql', params: { query: query }
        json = JSON.parse(response.body, symbolize_names: true)
        data = json[:data][:addDogSkill]

        expect(data[:dogId]).to be_a Integer
        expect(data[:skillId]).to be_a Integer
        expect(data[:passed]).to eq false

        expect(data[:passed]).to_not eq true
      end

      it 'will return an error message if missing dog id' do 
        post "/graphql", params: { query: missing_dog_id }

        json = JSON.parse(response.body, symbolize_names: true)
        data = json[:errors]
       
        expect(data[0][:message]).to eq("One or more required inputs missing. Please double check and try again")
      end 

      it 'will return an error message if missing skill id' do 
        post "/graphql", params: { query: missing_skill_id }

        json = JSON.parse(response.body, symbolize_names: true)
        data = json[:errors]
        
        expect(data[0][:message]).to eq("One or more required inputs missing. Please double check and try again")
      end 

      def query
        <<~GQL
                  mutation {
            addDogSkill(input: {dogId: #{@dog.id}, skillId: #{@skill.id}, passed: false}) {
              id
              dogId
              skillId
              passed
            }
          }
        GQL
      end

      def missing_dog_id
        <<~GQL
                  mutation {
            addDogSkill(input: {dogId: null, skillId: #{@skill.id}, passed: false}) {
              id
              dogId
              skillId
              passed
            }
          }
        GQL
      end 

      def missing_skill_id
        <<~GQL
                  mutation {
            addDogSkill(input: {dogId: #{@dog.id}, skillId: null, passed: false}) {
              id
              dogId
              skillId
              passed
            }
          }
        GQL
      end 
    end
  end
end
