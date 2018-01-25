class AddPreferredGenderToFamilies < ActiveRecord::Migration[5.1]
  def change
    add_column :families, :preferred_gender, :string
  end
end
