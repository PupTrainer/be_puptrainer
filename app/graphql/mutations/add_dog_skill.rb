class Mutations::AddDogSkill < Mutations::BaseMutation

  argument :skill_id, Integer, required: true
  argument :dog_id, Integer, required: true
  argument :passed, Boolean, required: true

  type Types::DogSkillType

  def resolve(dog_id:, skill_id:, passed:)
    dog = Dog.find(dog_id)
    skill = Skill.find(skill_id)
    dog_skill = DogSkill.create(dog_id: dog.id, skill_id: skill.id, passed: false)
  end
end
