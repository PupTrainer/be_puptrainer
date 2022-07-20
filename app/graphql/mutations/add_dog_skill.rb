class Mutations::AddDogSkill < Mutations::BaseMutation

  argument :skill_id, Integer, required: true
  argument :dog_id, Integer, required: false
  argument :passed, Boolean, required: true

  type Types::DogSkillType

  def resolve(dog_id:, skill_id:, passed:)
    begin
      dog = Dog.find(dog_id)
      skill = Skill.find(skill_id)
      dog_skill = DogSkill.create(dog_id: dog.id, skill_id: skill.id, passed: false)
    rescue ActiveRecord::RecordNotFound => _e 
    GraphQL::ExecutionError.new("One or more required inputs missing. Please double check and try again")
    end
  end
end
