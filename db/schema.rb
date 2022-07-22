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

ActiveRecord::Schema[7.0].define(version: 2022_07_20_045918) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "instructors", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "initials"
    t.string "license"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jumps", force: :cascade do |t|
    t.string "type"
    t.integer "status", default: 0, null: false
    t.bigint "instructor_id"
    t.bigint "student_id"
    t.jsonb "questionnaire"
    t.string "improvement_points", array: true
    t.integer "jump_no"
    t.date "date"
    t.string "place"
    t.string "equipment"
    t.string "aircraft"
    t.integer "altitude_ft"
    t.integer "delay"
    t.integer "total_freefall"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instructor_id"], name: "index_jumps_on_instructor_id"
    t.index ["student_id"], name: "index_jumps_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.date "birthday"
    t.string "phone"
    t.string "email"
    t.string "country"
    t.string "city"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "login", null: false
    t.boolean "admin", default: false, null: false
    t.string "profile_type"
    t.bigint "profile_id"
    t.index ["login"], name: "index_users_on_login", unique: true
    t.index ["profile_type", "profile_id"], name: "index_users_on_profile"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "jumps", "instructors"
  add_foreign_key "jumps", "students"
end
