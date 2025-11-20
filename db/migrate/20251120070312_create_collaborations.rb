class CreateCollaborations < ActiveRecord::Migration[8.1]
  def change
    create_table :collaborations do |t|
      t.references :story, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :permission_mode
      t.string :role
      t.string :status
      t.integer :invited_by

      t.timestamps
    end
  end
end
