class CreateEventTemplates < ActiveRecord::Migration[8.1]
  def change
    create_table :event_templates do |t|
      t.references :life_phase, null: false, foreign_key: true
      t.string :title
      t.text :prompt
      t.text :example
      t.integer :sort_order

      t.timestamps
    end
  end
end
