class AddContraintsToRoles < ActiveRecord::Migration[7.1]
  def change
    change_column :roles, :name, :string, null: false
  end
end
