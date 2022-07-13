
module Types
  class DogSkillsType < Types::BaseObject
    field :id, ID, null: false
    field :passed, Boolean, null: false
    field :dog_id, Integer
    field :skill_id, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :Dog, Types::DogType, null: true
    def Dog
      Dog.find(object.dog_id)
    end
    field :Skill, Types::SkillType, null: true
    def Skill
      Skill.find(object.skill_id)
    end
  end
end
