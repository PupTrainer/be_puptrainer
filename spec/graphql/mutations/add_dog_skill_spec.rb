require 'rails_helper'

module Mutations
  RSpec.describe AddDogSkill, type: :request do
    describe '.resolve' do
      it 'returns a dog_skill ' do
      
        user = create(:user)
        dog = create(:dog, user_id: user.id)
        skill = Skill.create!(name: 'Sit', level: 1,
                              description: 'Step 1. Get your dogs attention with a treat. 2. While raising your hand upwards, say "sit". 3. Your dog should sit and look at you. 4. Reward your dog with the treat.', criteria: 'Your dog should sit right as you are saying the command, and stay sitting until you release them', youtube_link: 'https://www.youtube.com/watch?v=EDgi2sLlWAU')

        post '/graphql', params: { query: query }
        json = JSON.parse(response.body, symbolize_names: true)
        data = json[:data][:addDogSkill]

        expect(data[:dogId]).to be_a Integer
        expect(data[:skillId]).to be_a Integer
        expect(data[:passed]).to eq false

        expect(data[:passed]).to_not eq true
      end

      def query
        <<~GQL
                  mutation {
            addDogSkill(input: {dogId: 1, skillId: 1, passed: false}) {
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
