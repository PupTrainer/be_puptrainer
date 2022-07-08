class CreateDogSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :dog_skills do |t|
      t.boolean :passed
      t.references :dog, foreign_key: true
      t.references :skill, foreign_key: true

      t.timestamps
    end
  end
end
