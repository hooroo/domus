class CreateTripfamilies < ActiveRecord::Migration[5.1]
  def change
    create_table :trip_families do |t|
      t.belongs_to :family, index: true, null: false
      t.belongs_to :trip, index: true, null: false
      t.integer :total_girls, default: 0
      t.integer :total_boys, default: 0
      t.integer :total_teachers, default: 0
      t.integer :total_bus_drivers, default: 0
      t.timestamps
    end
  end
end
