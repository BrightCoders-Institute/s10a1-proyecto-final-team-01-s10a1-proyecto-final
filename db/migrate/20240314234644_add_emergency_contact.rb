class AddEmergencyContact < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :emergency_contact, :integer
  end
end
