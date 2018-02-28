# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180228015549) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "families", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name", null: false
    t.string "address"
    t.string "animals"
    t.string "capability", null: false
    t.string "preferred_gender"
    t.boolean "prof", default: false
    t.boolean "bus_driver", default: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "name", null: false
    t.string "responsible_name", null: false
    t.string "responsible_contact", null: false
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trip_families", force: :cascade do |t|
    t.bigint "family_id"
    t.bigint "trip_id"
    t.integer "total_girls", default: 0
    t.integer "total_boys", default: 0
    t.integer "total_techers", default: 0
    t.integer "total_bus_drivers", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_id"], name: "index_trip_families_on_family_id"
    t.index ["trip_id"], name: "index_trip_families_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.bigint "school_id"
    t.integer "total_girls", null: false
    t.integer "total_boys", null: false
    t.integer "total_teachers", null: false
    t.integer "total_bus_drivers", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_trips_on_school_id"
  end
end
