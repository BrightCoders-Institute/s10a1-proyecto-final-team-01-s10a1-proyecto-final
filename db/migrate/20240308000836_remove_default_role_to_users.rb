class RemoveDefaultRoleToUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_default(:users, :role_id, nil)
  end
end
