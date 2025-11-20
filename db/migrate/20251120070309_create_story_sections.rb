class CreateStorySections < ActiveRecord::Migration[8.1]
  def change
    create_table :story_sections do |t|
      t.references :chapter, null: false, foreign_key: true
      t.string :title
      t.integer :start_year
      t.integer :end_year
      t.integer :sort_order

      t.timestamps
    end
  end
end
