class CreateFamilies < ActiveRecord::Migration[5.1]
  def change
    create_table :families do |t|
      t.string :first_name
      t.string :last_name, null: false
      t.string :address
      t.string :animals
      t.integer :capability, null: false
      t.boolean :prof
      t.string :preffered_gender
      t.boolean :bus_driver
      t.boolean :active
      t.timestamps
    end
  end
end
