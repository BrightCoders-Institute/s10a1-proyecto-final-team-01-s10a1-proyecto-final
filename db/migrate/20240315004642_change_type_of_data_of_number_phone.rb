class ChangeTypeOfDataOfNumberPhone < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :phone, :string, limit: 16
    change_column :users, :emergency_contact, :string, limit: 16
  end
end
