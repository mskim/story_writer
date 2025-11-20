class CreateStoryProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :story_profiles do |t|
      t.references :story, null: false, foreign_key: true
      t.string :full_name
      t.integer :birth_year
      t.integer :current_age
      t.string :gender
      t.string :birthplace
      t.string :education_level
      t.string :primary_occupation
      t.boolean :military_service

      t.timestamps
    end
  end
end
