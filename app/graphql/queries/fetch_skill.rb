module Queries
  class FetchSkill < Queries::BaseQuery
    type [Types::SkillType], null: false

    def resolve(id:)
      skill = Skill.find(id.to_i)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('Skill does not exist.')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end