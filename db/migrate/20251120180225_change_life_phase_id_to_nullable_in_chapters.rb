class ChangeLifePhaseIdToNullableInChapters < ActiveRecord::Migration[8.1]
  def change
    change_column_null :chapters, :life_phase_id, true
    change_column_null :chapters, :sort_order, true
  end
end
