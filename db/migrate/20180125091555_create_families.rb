class CreateFamilies < ActiveRecord::Migration[5.1]
  def change
    create_table :families do |t|
      t.string :first_name
      t.string :last_name, null: false
      t.string :address
      t.string :animals
      t.string :capability, null: false
      t.string :preferred_gender
      t.boolean :prof, default: false
      t.boolean :bus_driver, default: false
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
