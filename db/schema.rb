# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2025_11_20_190838) do
  create_table "accounts", force: :cascade do |t|
    t.string "account_type"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "chapters", force: :cascade do |t|
    t.integer "chapter_number"
    t.datetime "created_at", null: false
    t.text "description"
    t.integer "life_phase_id"
    t.integer "sort_order"
    t.integer "story_id", null: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["life_phase_id"], name: "index_chapters_on_life_phase_id"
    t.index ["story_id"], name: "index_chapters_on_story_id"
  end

  create_table "collaborations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "invited_by"
    t.string "permission_mode"
    t.string "role"
    t.string "status"
    t.integer "story_id", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["story_id"], name: "index_collaborations_on_story_id"
    t.index ["user_id"], name: "index_collaborations_on_user_id"
  end

  create_table "event_templates", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "example"
    t.integer "life_phase_id", null: false
    t.text "prompt"
    t.integer "sort_order", null: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["life_phase_id"], name: "index_event_templates_on_life_phase_id"
  end

  create_table "life_phases", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "icon"
    t.string "name"
    t.string "slug"
    t.integer "sort_order"
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.text "caption"
    t.datetime "created_at", null: false
    t.integer "sort_order", null: false
    t.integer "story_id", null: false
    t.integer "story_section_id", null: false
    t.datetime "updated_at", null: false
    t.integer "year_taken"
    t.index ["story_id"], name: "index_photos_on_story_id"
    t.index ["story_section_id"], name: "index_photos_on_story_section_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "stories", force: :cascade do |t|
    t.integer "account_id", null: false
    t.datetime "created_at", null: false
    t.string "status"
    t.string "subtitle"
    t.string "title"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["account_id"], name: "index_stories_on_account_id"
    t.index ["user_id"], name: "index_stories_on_user_id"
  end

  create_table "story_profiles", force: :cascade do |t|
    t.text "advice_to_children"
    t.integer "birth_year"
    t.string "birthplace"
    t.datetime "created_at", null: false
    t.integer "current_age"
    t.string "education_level"
    t.string "full_name"
    t.string "gender"
    t.text "greatest_lessons_learned"
    t.text "hobbies_interests"
    t.text "influential_people"
    t.text "life_mission"
    t.text "life_philosophy"
    t.text "major_awards"
    t.text "military_details"
    t.boolean "military_service"
    t.text "other_occupations"
    t.string "primary_occupation"
    t.text "schools_attended"
    t.text "significant_life_events"
    t.integer "story_id", null: false
    t.datetime "updated_at", null: false
    t.index ["story_id"], name: "index_story_profiles_on_story_id"
  end

  create_table "story_sections", force: :cascade do |t|
    t.integer "chapter_id", null: false
    t.datetime "created_at", null: false
    t.integer "end_year"
    t.integer "sort_order", null: false
    t.integer "start_year"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_story_sections_on_chapter_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "account_id", null: false
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "language"
    t.string "name"
    t.string "password_digest", null: false
    t.string "role"
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_users_on_account_id"
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "chapters", "life_phases"
  add_foreign_key "chapters", "stories"
  add_foreign_key "collaborations", "stories"
  add_foreign_key "collaborations", "users"
  add_foreign_key "event_templates", "life_phases"
  add_foreign_key "photos", "stories"
  add_foreign_key "photos", "story_sections"
  add_foreign_key "sessions", "users"
  add_foreign_key "stories", "accounts"
  add_foreign_key "stories", "users"
  add_foreign_key "story_profiles", "stories"
  add_foreign_key "story_sections", "chapters"
  add_foreign_key "users", "accounts"
end
