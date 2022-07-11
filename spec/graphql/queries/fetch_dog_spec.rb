require 'rails_helper'

module Queries
    RSpec.describe FetchDog, type: :request do 
        describe '.resolve' do 
            it 'returns a dog with the given id' do 
                user1 = User.create!(username: 'bigdaddy', email: 'bigdaddy@brisketville.com')
                dog1 = Dog.create!(name: "Olive", age: 2, breed: 'australian shepherd mix', user_id: user1.id)

                post '/graphql', params: { query: query }
                json = JSON.parse(response.body, symbolize_names: true)
                data = json[:data][:fetchDog]

                expect(data).to have_key(:name)
                expect(data[:name]).to be_a(String)
                expect(data).to have_key(:age)
                expect(data[:age]).to be_a(Integer)
                expect(data).to have_key(:breed)
                expect(data[:breed]).to be_a(String)
                expect(data).to have_key(:user)
                expect(data[:user]).to have_key(:id)
                expect(data[:user][:id]).to be_a(String)
                expect(data[:user]).to have_key(:username)
                expect(data[:user][:username]).to be_a(String)
                expect(data[:user]).to have_key(:email)
                expect(data[:user][:email]).to be_a(String)
            end 
        end 

        def query 
            <<~GQL
                query {
                    fetchDog(id: 1) {
                        name
                        age
                        breed
                        user {
                            id
                            username
                            email
                        }
                    }
                }
            GQL
        end 
    end 
end 