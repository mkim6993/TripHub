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

ActiveRecord::Schema[7.0].define(version: 2022_09_23_185321) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "location_id"
    t.string "name"
    t.string "description"
    t.string "address"
    t.string "contact"
    t.integer "price"
    t.string "image"
    t.string "open_times"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "star_fans", force: :cascade do |t|
    t.string "star_id"
    t.string "fan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trip_locations", force: :cascade do |t|
    t.string "location_id"
    t.string "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trip_users", force: :cascade do |t|
    t.string "trip_id"
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string "trip_id"
    t.string "create_by"
    t.date "date_created"
    t.date "trip_date"
    t.string "title"
    t.string "description"
    t.integer "upvotes"
    t.integer "shares"
    t.boolean "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_id"
    t.string "name"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
