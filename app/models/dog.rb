class Dog < ApplicationRecord
    validates_presence_of :name,
                          :age,
                          :breed 
    belongs_to :user 
    has_many :dog_skills
    has_many :skills, through: :dog_skills 
end 