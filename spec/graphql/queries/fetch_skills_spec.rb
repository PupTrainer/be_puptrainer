require 'rails_helper'

module Queries
  RSpec.describe FetchSkills, type: :request do 
    describe '.resolve' do 
      it 'returns all skills' do 
        sit = Skill.create!(name: "Sit", level: 1, description: 'Step 1. Get your dogs attention with a treat. 2. While raising your hand upwards, say "sit". 3. Your dog should sit and look at you. 4. Reward your dog with the treat.', criteria: "Your dog should sit right as you are saying the command, and stay sitting until you release them", youtube_link: "https://www.youtube.com/watch?v=EDgi2sLlWAU")
        down = Skill.create!(name: "Down", level: 2, description: 'Step 1. Get your dogs attention with a treat. 2. While lowering your hand to the floor and moving it towards you, say "down". 3. Your dog should lay down look at you. 4. Reward your dog with the treat.', criteria: "Your dog should lay down right as you are saying the command, and stay laying until you release them", youtube_link: "https://www.youtube.com/watch?v=vkHs_rKdloc")
        shake = Skill.create!(name: "Shake", level: 3, description: "Step 1. Get your dogs attention with a treat. 2. Have your dog sit. 3. Extend your empty hand towards one of your dogs paws, move the treat towards your dogs ear opposite the paw to shake, all while saying shake. 4. Shake hands wih your dog", criteria: "Your dog should be able to shake with just the verbal cue.", youtube_link: "https://www.youtube.com/watch?v=CRoDTUkzVpU)")

        post '/graphql', params: { query: query }
        json = JSON.parse(response.body, symbolize_names: true)
        skills = json[:data][:fetchSkills]

        expect(skills).to be_an Array
        expect(skills.count).to eq(3)
        skills.each do |skill|
          expect(skill).to be_a Hash 

          expect(skill).to have_key(:id)
          expect(skill[:id]).to be_a String

          expect(skill).to have_key(:name)
          expect(skill[:name]).to be_a String

          expect(skill).to have_key(:level)
          expect(skill[:level]).to be_an Integer

          expect(skill).to have_key(:description)
          expect(skill[:description]).to be_a String

          expect(skill).to have_key(:criteria)
          expect(skill[:criteria]).to be_a String

          expect(skill).to have_key(:youtubeLink)
          expect(skill[:youtubeLink]).to be_a String
        end 
      end
    end

    def query
      <<~GQL
        query {
          fetchSkills{
            id
            name
            level
            description
            criteria
            youtubeLink
          }
        }
      GQL
    end 


  end
end
