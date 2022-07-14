class Mutations::PassDogSkill < Mutations::BaseMutation
    argument :dog_skill_id, Integer, required: true

    field :dog_skill, Types::DogSkillType, null: true
    field :errors, [String], null: false

    def resolve(dog_skill_id:)
        begin
        dog_skill =  DogSkill.find(dog_skill_id)
        rescue ActiveRecord::RecordNotFound => e
            raise GraphQL::ExecutionError, "Bad ID: dog_skill not found!"
        end
        dog_skill.update!(passed: true)
        if dog_skill.passed == true
            {dog_skill: dog_skill, errors: []}
        else
            raise GraphQL::ExecutionError, "Server Error: Your record was found, but the status failed to update."
        end
    end
end