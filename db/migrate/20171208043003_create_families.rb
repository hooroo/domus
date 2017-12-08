class CreateFamilies < ActiveRecord::Migration[5.1]
  def change
    create_table :families do |t|
      t.string :name
      t.string :surname
      t.string :address
      t.string :animals
      t.string :capability
      t.boolean :prof
      t.boolean :bus_driver
      t.boolean :active
      t.timestamps
    end
  end
end
