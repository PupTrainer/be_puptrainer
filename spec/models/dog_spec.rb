require 'rails_helper'

RSpec.describe Dog, type: :model do
    describe 'validations' do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:age) }
        it { should validate_presence_of(:breed) }
    end 

    describe 'relationships' do 
        it { should belong_to(:user)}
        it { should have_many(:skills)}
    end 
end 