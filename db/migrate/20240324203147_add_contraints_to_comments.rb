class AddContraintsToComments < ActiveRecord::Migration[7.1]
  def change
    change_column :comments, :title, :string, null: false, limit: 100
  end
end
