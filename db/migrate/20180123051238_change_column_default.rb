class ChangeColumnDefault < ActiveRecord::Migration[5.1]
  def change
    change_column :families, :prof, :boolean, default: false
    change_column :families, :bus_driver, :boolean, default: false
    change_column :families, :active, :boolean, default: true
  end
end
