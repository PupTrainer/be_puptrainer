class Mutations::PassDogSkill < Mutations::BaseMutation
    argument :dog_id_input, Integer, required: true
    argument :skill_id_input, Integer, required: true

    field :dog_skill, Types::DogSkillType, null: true
    field :errors, [String], null: false

    def resolve(dog_id_input:, skill_id_input:)
        dog_skill =  DogSkill.where(dog_id: dog_id_input, skill_id: skill_id_input)
        if dog_skill.length > 1
            raise GraphQL::ExecutionError, "Server Error: We expected your queary to return one result, but found several. Please check your inputs."
        elsif dog_skill.length == 0
            raise GraphQL::ExecutionError, "DogSkill Not Found: Your given dog_id and skill_id do not have a matching dog_skill. Please check your inputs"
        elsif dog_skill.first.passed != true
            dog_skill.first.update!(passed: true, updated_at: Time.now)
            {dog_skill: dog_skill.first, errors: []}
        elsif dog_skill.first.passed == true
            {dog_skill: dog_skill.first, errors: ["Warning: 'pass' was already set to 'true' for this dog_skill"]}
        else
            raise GraphQL::ExecutionError, "Server Error: our app's gone off the rails! please report this error to BE team."
        end
    end
end