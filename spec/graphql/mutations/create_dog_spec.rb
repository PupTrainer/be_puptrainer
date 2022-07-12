require "rails_helper"

module Mutations
  RSpec.describe CreateDog, type: :request do
    describe ".resolve" do
      it "creates a dog" do
        user = create(:user)
        # dog = create(:dog, {user_id: user.id})

        post "/graphql", params: {query: query}
        json = JSON.parse(response.body, symbolize_names: true)
        data = json[:data][:createDog]

        expect(data[:name]).to be_a String

        expect(data[:age]).to be_a Integer

        expect(data[:breed]).to be_a String
      end
      def query
        <<~GQL
          mutation {
            createDog(input: {

              name: "Cujo"
              age: 2
              breed: "Saint Bernard"
              userId: 1
            })  {
                id
                name
                age
                breed
              }

          }
        GQL
      end
    end
  end
end
