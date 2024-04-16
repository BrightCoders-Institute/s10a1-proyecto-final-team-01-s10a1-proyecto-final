class AddContraintsToDetails < ActiveRecord::Migration[7.1]
  def change
    change_column :details, :name, :string, null: false
  end
end
