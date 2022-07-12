require 'rails_helper'

module Queries
    RSpec.describe FetchSkill, type: :request do 
        describe '.resolve' do 
            it 'returns a skill with the given id' do 
                sit = Skill.create!(name: "Sit", level: 1, description: 'Step 1. Get your dogs attention with a treat. 2. While raising your hand upwards, say "sit". 3. Your dog should sit and look at you. 4. Reward your dog with the treat.', criteria: "Your dog should sit right as you are saying the command, and stay sitting until you release them", youtube_link: "https://www.youtube.com/watch?v=EDgi2sLlWAU")
                
                post '/graphql', params: { query: query }
                json = JSON.parse(response.body, symbolize_names: true)
                data = json[:data][:fetchSkill]

                expect(data).to be_a Hash

                expect(data).to have_key(:name)
                expect(data[:name]).to be_a String

                expect(data).to have_key(:level)
                expect(data[:level]).to be_a Integer

                expect(data).to have_key(:description)
                expect(data[:description]).to be_a String

                expect(data).to have_key(:criteria)
                expect(data[:criteria]).to be_a String

                expect(data).to have_key(:youtubeLink)
                expect(data[:youtubeLink]).to be_a String
                
            end 

        end 

        describe 'sad path' do 
            it 'returns an error message if given an invalid id' do 
            
                post "/graphql", params: {query: query_2}
                json = JSON.parse(response.body, symbolize_names: true)
                
                data = json[:errors]

                expect(data[0]).to eq({:message=>"Skill does not exist.", :locations=>[{:line=>2, :column=>5}], :path=>["fetchSkill"]})
                
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
                        youtubeLink
                    }
                }
            GQL
        end 

        def query_2
            <<~GQL
                query {
                    fetchSkill(id: 2) {
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