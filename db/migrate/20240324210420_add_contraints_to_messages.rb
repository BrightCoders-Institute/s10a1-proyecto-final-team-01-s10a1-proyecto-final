class AddContraintsToMessages < ActiveRecord::Migration[7.1]
  def change
    change_column :messages, :text, :string, null: false
  end
end
