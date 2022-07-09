require 'rails_helper'

module Mutations
  module Users
    RSpec.describe CreateUser, type: :request do
      describe '.resolve' do
        it 'creates a user' do
          user = create(:user)
          binding.pry

        end 



      end 

    end

  end
end
