class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :level
      t.text :description
      t.text :criteria
      t.string :youtube_link

      t.timestamps
    end
  end
end
