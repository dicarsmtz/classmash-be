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

ActiveRecord::Schema[8.0].define(version: 2025_07_13_200849) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "locations", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "name"
    t.text "description"
    t.string "handle", limit: 50, null: false
    t.string "phone_number", limit: 20
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "ix_locations__email"
    t.index ["handle"], name: "ix_locations__handle"
    t.index ["organization_id"], name: "ix_locations__organization_id"
    t.index ["phone_number"], name: "ix_locations__phone_number"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "handle", limit: 50, null: false
    t.string "phone_number", limit: 20
    t.string "email"
    t.string "country_code", limit: 2
    t.string "website"
    t.string "profile_image_url"
    t.string "background_image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "ix_organizations__email", unique: true
    t.index ["handle"], name: "ix_organizations__handle", unique: true
    t.index ["phone_number"], name: "ix_organizations__phone_number", unique: true
  end

  create_table "school_locations", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "school_id", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "ix_school_locations__organization_id"
    t.index ["school_id", "location_id"], name: "ix_school_locations__school_id_location_id", unique: true
  end

  create_table "schools", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "name", null: false
    t.text "description"
    t.string "handle", limit: 50, null: false
    t.string "phone_number", limit: 20
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "ix_schools__email"
    t.index ["handle"], name: "ix_schools__handle"
    t.index ["organization_id"], name: "ix_schools__organization_id"
    t.index ["phone_number"], name: "ix_schools__phone_number"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", limit: 50, null: false
    t.string "last_name", limit: 50, null: false
    t.string "display_name", limit: 100
    t.date "date_of_birth"
    t.string "handle", limit: 30, null: false
    t.string "phone_number", limit: 20
    t.string "email", null: false
    t.string "password", limit: 60, null: false
    t.string "country_code", limit: 2
    t.string "locale", limit: 5
    t.string "currency", limit: 3
    t.string "profile_image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "ix_users__email", unique: true
    t.index ["handle"], name: "ix_users__handle", unique: true
    t.index ["phone_number"], name: "ix_users__phone_number", unique: true
  end

  add_foreign_key "locations", "organizations"
  add_foreign_key "school_locations", "locations"
  add_foreign_key "school_locations", "schools"
  add_foreign_key "school_locations", "schools", column: "organization_id"
  add_foreign_key "schools", "organizations"
end
