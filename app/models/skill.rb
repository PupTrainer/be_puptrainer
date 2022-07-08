class Skill < ApplicationRecord
    validates_presence_of :name,
                          :level,
                          :description,
                          :criteria,
                          :youtube_link
    has_many :dogs, through: :dog_skills
end 