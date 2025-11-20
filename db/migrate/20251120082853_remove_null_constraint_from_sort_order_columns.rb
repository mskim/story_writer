class RemoveNullConstraintFromSortOrderColumns < ActiveRecord::Migration[8.1]
  def change
    change_column_null :chapters, :sort_order, true
    change_column_null :story_sections, :sort_order, true
    change_column_null :event_templates, :sort_order, true
    change_column_null :photos, :sort_order, true
  end
end
