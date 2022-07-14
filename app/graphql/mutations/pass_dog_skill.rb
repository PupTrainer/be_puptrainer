class Mutations::PassDogSkill < Mutations::BaseMutation
    
    argument :dog_skill_id, Integer, required: true

    field :dog_skill, Types::DogSkillType, null: false
    field :errors, [String], null: false

    def resolve(dog_skill_id:)
        dog_skill =  DogSkill.find(dog_skill_id)
        dog_skill.update(passed: true)
        if dog_skill.passed
            {dog_skill: dog_skill, errors: []}
        else
            {dog_skill: null, errors: ["Status failed to update"]}
        end
    end
end