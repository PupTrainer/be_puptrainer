require "rails_helper"

module Mutations
  RSpec.describe PassDogSkill, type: :request do
    describe ".resolve" do
      it "update a dog skill's 'passed' status to true" do
        user = create(:user)
        dog = create(:dog, user_id: user.id)
        skill = Skill.create!(name: "Oh You", level: 3 , description: "Running and Barking will no longer annoy your owners", criteria: " When running and barking, humans should not correct the behavior, but should sign and say 'oh, you....'" , youtube_link: "AtuxAJjygO8", created_at: Time.parse("2020.07.12"), updated_at: Time.parse("2020.07.12"))
        dog_skill = dog.dog_skills.create!(passed: false, dog_id: dog.id, skill_id: skill.id, created_at: Time.parse("2022.07.12"), updated_at: Time.parse("2022.07.12"))
        
        post "graphql/", params: {query: query, variables: {dog_skill_id: dog_skill.id.to_s}}
        response_body = JSON.parse(response.body, symbolize_names: true)

        # Test response shape 
        expect(response_body.keys.count).to eq 1
        expect(response_body[:dog_skill].keys.count).to eq 6
        expect(response_body[:dog_skill][:id].class).to eq BigInt
        expect(response_body[:dog_skill][:dog_id].class).to eq BigInt
        expect(response_body[:dog_skill][:skill_id].class).to eq BigInt
        expect(response_body[:dog_skill][:status].class).to eq Boolean
        expect(response_body[:dog_skill][:created_at].class).to eq DateTime
        expect(response_body[:dog_skill][:updated_at].class).to eq DateTime

        # Test that update was timestamped 
        expect(response_body[:dog_skill][:updated_at]).to_not eq dog_skill.created_at

        # Test that status was updated specifically to true
        expect(response_body[:dog_skill][:status]).to eq true
      end

      def query
        <<~GQL
          mutation {
            passSkill(input: {
              $dog_skill_id: dog_skill_id!
            }) {
              dog_skill {
                id
                skill_id
                dog_id
                status
                created_at:
                updated_at: 
              }
              errors
            }
          }
        GQL
      end
    end
  end
end
