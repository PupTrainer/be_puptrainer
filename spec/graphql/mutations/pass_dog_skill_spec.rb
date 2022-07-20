require "rails_helper"

module Mutations
  RSpec.describe PassDogSkill, type: :request do
    describe ".resolve" do

      it "update a dog skill's 'passed' status to true" do
        user = create(:user)
        dog = create(:dog, user_id: user.id)
        skill = Skill.create!(name: "Oh You", level: 3 , description: "Running and Barking will no longer annoy your owners", criteria: " When running and barking, humans should not correct the behavior, but should sign and say 'oh, you....'" , youtube_link: "AtuxAJjygO8", created_at: Time.parse("2020.07.12"), updated_at: Time.parse("2020.07.12"))
        dog_skill = dog.dog_skills.create!(passed: false, dog_id: dog.id, skill_id: skill.id, created_at: Time.parse("2022.07.12"), updated_at: Time.parse("2022.07.12"))
        
        post "/graphql", params: {query: good_query(dog.id, skill.id)}
        response_body = JSON.parse(response.body, symbolize_names: true)

        # Test response shape 
        expect(response_body.keys.count).to eq 1
        expect(response_body[:data].keys.count).to eq 1
        expect(response_body[:data][:passDogSkill].keys.count).to eq 2
        expect(response_body[:data][:passDogSkill][:dogSkill].keys.count).to eq 6
        expect(response_body[:data][:passDogSkill][:dogSkill][:id]).to eq dog_skill.id.to_s
        expect(response_body[:data][:passDogSkill][:dogSkill][:dogId]).to eq dog_skill.dog_id
        expect(response_body[:data][:passDogSkill][:dogSkill][:skillId]).to eq dog_skill.skill_id
        expect(response_body[:data][:passDogSkill][:dogSkill][:passed]).to eq true
        expect(Time.parse(response_body[:data][:passDogSkill][:dogSkill][:createdAt])).to eq dog_skill.created_at
        expect(response_body[:data][:passDogSkill][:errors]).to eq []
        # Test that update was timestamped 
        expect(Time.parse(response_body[:data][:passDogSkill][:dogSkill][:updatedAt])).to_not eq dog_skill.created_at

        # Test that status was updated specifically to true
        expect(response_body[:data][:passDogSkill][:dogSkill][:passed]).to eq true
      end

      it "errors when passed a bad id" do
        user = create(:user)
        dog = create(:dog, user_id: user.id)
        skill = Skill.create!(name: "Oh You", level: 3 , description: "Running and Barking will no longer annoy your owners", criteria: " When running and barking, humans should not correct the behavior, but should sign and say 'oh, you....'" , youtube_link: "AtuxAJjygO8", created_at: Time.parse("2020.07.12"), updated_at: Time.parse("2020.07.12"))
        dog_skill = dog.dog_skills.create!(passed: false, dog_id: dog.id, skill_id: skill.id, created_at: Time.parse("2022.07.12"), updated_at: Time.parse("2022.07.12"))
        # Errors with bad dog_id
        post "/graphql", params: {query: good_query(dog.id+9999, skill.id)}
        response_body = JSON.parse(response.body, symbolize_names: true)
        expect(response_body[:data][:passDogSkill]).to be nil
        expect(response_body[:errors].first[:message]).to eq "DogSkill Not Found: Your given dog_id and skill_id do not have a matching dog_skill. Please check your inputs"
        # Same error with bad skill_id
        post "/graphql", params: {query: good_query(dog.id+9999, skill.id)}
        response_body = JSON.parse(response.body, symbolize_names: true)
        expect(response_body[:data][:passDogSkill]).to be nil
        expect(response_body[:errors].first[:message]).to eq "DogSkill Not Found: Your given dog_id and skill_id do not have a matching dog_skill. Please check your inputs"
      end

      it "warns if a dog_skill's 'passed' was already true" do
        user = create(:user)
        dog = create(:dog, user_id: user.id)
        skill = Skill.create!(name: "Oh You", level: 3 , description: "Running and Barking will no longer annoy your owners", criteria: " When running and barking, humans should not correct the behavior, but should sign and say 'oh, you....'" , youtube_link: "AtuxAJjygO8", created_at: Time.parse("2020.07.12"), updated_at: Time.parse("2020.07.12"))
        dog_skill = dog.dog_skills.create!(passed: false, dog_id: dog.id, skill_id: skill.id, created_at: Time.parse("2022.07.12"), updated_at: Time.parse("2022.07.12"))
        
        post "/graphql", params: {query: good_query(dog.id, skill.id)}
        post "/graphql", params: {query: good_query(dog.id, skill.id)}
        response_body = JSON.parse(response.body, symbolize_names: true)
        
        expect(response_body[:data][:passDogSkill][:errors]).to eq ["Warning: 'pass' was already set to 'true' for this dog_skill"]        
      end

      def good_query(dog_id_input, skill_id_input)
        <<~GQL
        mutation {
          passDogSkill(input: {
            dogIdInput: #{dog_id_input}
            skillIdInput: #{skill_id_input}
          }) {
              dogSkill {
                id
                dogId
                skillId
                passed
                createdAt
                updatedAt
              }
            errors
          }
        }
        
        GQL
      end

      def bad_query
        <<~GQL
        mutation {
          passDogSkill(input: {
            dogSkillId: 9999999
          }) {
              dogSkill {
                id
                dogId
                skillId
                passed
                createdAt
                updatedAt
              }
            errors
          }
        }
        
        GQL
      end
    end
  end
end
