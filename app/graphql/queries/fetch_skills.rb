module Queries 
  class FetchSkills < Queries::BaseQuery
    type [Types::SkillType], null: false

    def resolve
      Skill.all.order(level: :desc)
    end 

  end
end