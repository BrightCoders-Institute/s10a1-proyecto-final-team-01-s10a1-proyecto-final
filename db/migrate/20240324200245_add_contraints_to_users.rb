class AddContraintsToUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :role_id, :bigint, default: 4
    change_column :users, :name, :string, limit: 50
  end
end
