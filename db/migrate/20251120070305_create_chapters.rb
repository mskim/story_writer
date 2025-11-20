class CreateChapters < ActiveRecord::Migration[8.1]
  def change
    create_table :chapters do |t|
      t.references :story, null: false, foreign_key: true
      t.references :life_phase, null: true, foreign_key: true
      t.string :title
      t.text :description
      t.integer :chapter_number
      t.integer :sort_order

      t.timestamps
    end
  end
end
