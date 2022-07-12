require "rails_helper"

RSpec.describe Skill, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:level) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:criteria) }
    it { should validate_presence_of(:youtube_link) }
  end

  describe "relationships" do
    it { should have_many(:dogs) }
  end
end
