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
        if dog_skill.passed != true
            dog_skill.update!(passed: true, updated_at: Time.now)
            {dog_skill: dog_skill, errors: []}
        elsif dog_skill.passed == true
            {dog_skill: dog_skill, errors: ["Warning: 'pass' was already set to 'true' for this dog_skill"]}
        else
            raise GraphQL::ExecutionError, "Server Error: our app's gone off the rails! please report this error to BE team."
        end
    end
end