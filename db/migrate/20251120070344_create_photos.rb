class CreatePhotos < ActiveRecord::Migration[8.1]
  def change
    create_table :photos do |t|
      t.references :story, null: false, foreign_key: true
      t.references :story_section, null: true, foreign_key: true
      t.text :caption
      t.integer :year_taken
      t.integer :sort_order

      t.timestamps
    end
  end
end
