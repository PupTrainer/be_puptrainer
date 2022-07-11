require "rails_helper"

module Mutations
  RSpec.describe CreateUser, type: :request do
    describe ".resolve" do
      it "creates a user" do
        count = User.count
        post "/graphql", params: {query: query}
        json = JSON.parse(response.body, symbolize_names: true)
        data = json[:data][:createUser]

        expect(data[:user]).to have_key(:username)
        expect(data[:user][:username]).to be_a String

        expect(data[:user]).to have_key(:email)
        expect(data[:user][:email]).to be_a String

        expect(data[:user]).to have_key(:id)
        expect(data[:user][:id]).to be_ String

        expect(count).to_not eq(User.count)
      end

      def query
        <<~GQL
          mutation {
            createUser(input: {
              username: "CheeseMan"
              email: "cheese@wiz.com"
            }) {
              user {
                id
                username
                email
              }
              errors
            }
          }
        GQL
      end
    end
  end
end
