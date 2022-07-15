require "rails_helper"

module Mutations
  RSpec.describe PassDogSkill, type: :request do
    describe ".resolve" do

      it "update a dog skill's 'passed' status to true" do
        user = create(:user)
        dog = create(:dog, user_id: user.id)
        skill = Skill.create!(name: "Oh You", level: 3 , description: "Running and Barking will no longer annoy your owners", criteria: " When running and barking, humans should not correct the behavior, but should sign and say 'oh, you....'" , youtube_link: "AtuxAJjygO8", created_at: Time.parse("2020.07.12"), updated_at: Time.parse("2020.07.12"))
        dog_skill = dog.dog_skills.create!(passed: false, dog_id: dog.id, skill_id: skill.id, created_at: Time.parse("2022.07.12"), updated_at: Time.parse("2022.07.12"))
        
        post "/graphql", params: {query: good_query}
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
        
        post "/graphql", params: {query: bad_query}
        response_body = JSON.parse(response.body, symbolize_names: true)
        expect(response_body[:data][:passDogSkill]).to be nil
        expect(response_body[:errors].first[:message]).to eq "Bad ID: dog_skill not found!"
      end

      def good_query
        <<~GQL
        mutation {
          passDogSkill(input: {
            dogSkillId:1
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
            dogSkillId:5
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
