class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.string :responsable_name, null: false
      t.string :responsable_contact, null: false
      t.date :from_date, null: false
      t.date :to_date, null: false
      t.text :notes
      t.timestamps
    end
  end
end
