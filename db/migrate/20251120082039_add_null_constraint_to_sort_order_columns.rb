class AddNullConstraintToSortOrderColumns < ActiveRecord::Migration[8.1]
  def change
    # First, set any NULL values to 1 (will be healed later)
    Chapter.where(sort_order: nil).update_all(sort_order: 1)
    StorySection.where(sort_order: nil).update_all(sort_order: 1)
    EventTemplate.where(sort_order: nil).update_all(sort_order: 1)
    Photo.where(sort_order: nil).update_all(sort_order: 1)

    # Now add the null: false constraint
    change_column_null :chapters, :sort_order, false, 1
    change_column_null :story_sections, :sort_order, false, 1
    change_column_null :event_templates, :sort_order, false, 1
    change_column_null :photos, :sort_order, false, 1
  end
end
