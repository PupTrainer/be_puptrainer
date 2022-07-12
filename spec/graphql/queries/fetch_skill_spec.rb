require 'rails_helper'

module Queries
    RSpec.describe FetchSkill, type: :request do 
        describe '.resolve' do 
            it 'returns a skill with the given id' do 
                sit = Skill.create!(name: "Sit", level: 1, description: 'Step 1. Get your dogs attention with a treat. 2. While raising your hand upwards, say "sit". 3. Your dog should sit and look at you. 4. Reward your dog with the treat.', criteria: "Your dog should sit right as you are saying the command, and stay sitting until you release them", youtube_link: "https://www.youtube.com/watch?v=EDgi2sLlWAU")
                
                post '/graphql', params: { query: query }
                json = JSON.parse(response.body, symbolize_names: true)
            end 
        end 
        
        def query
            <<~GQL
                query {
                    fetchSkill(id: 1) {
                        name
                        level
                        description
                        criteria
                        youtube_link
                    }
                }
            GQL
        end 
    end 
end 