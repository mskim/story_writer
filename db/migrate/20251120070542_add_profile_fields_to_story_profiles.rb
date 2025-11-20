class AddProfileFieldsToStoryProfiles < ActiveRecord::Migration[8.1]
  def change
    add_column :story_profiles, :schools_attended, :text
    add_column :story_profiles, :other_occupations, :text
    add_column :story_profiles, :military_details, :text
    add_column :story_profiles, :major_awards, :text
    add_column :story_profiles, :significant_life_events, :text
    add_column :story_profiles, :hobbies_interests, :text
    add_column :story_profiles, :influential_people, :text
    add_column :story_profiles, :life_mission, :text
    add_column :story_profiles, :life_philosophy, :text
    add_column :story_profiles, :advice_to_children, :text
    add_column :story_profiles, :greatest_lessons_learned, :text
  end
end
