class CreateLifePhases < ActiveRecord::Migration[8.1]
  def change
    create_table :life_phases do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.integer :sort_order
      t.string :icon

      t.timestamps
    end
  end
end
