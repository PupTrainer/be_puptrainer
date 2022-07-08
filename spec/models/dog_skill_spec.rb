require 'rails_helper'

RSpec.describe DogSkill, type: :model do 
    describe 'relationships' do 
        it { should belong_to(:dog)}
        it { should belong_to(:skill)}
    end 
end 