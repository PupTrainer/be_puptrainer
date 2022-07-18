class Mutations::AddDogSkill < Mutations::BaseMutation
  argument :skill_ids, [ID], loads: Types::SkillType
  type Types::DogType

  def resolve(dog_id:, **attributes)

    dog = Dog.find(dog_id)
    dogskill = Skill.find(skill_id).dogskill.create!(attributes)
    [:skills].each do |skill|
  end
end
