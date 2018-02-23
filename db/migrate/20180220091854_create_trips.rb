class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
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
      t.timestamps
    end
  end
end
