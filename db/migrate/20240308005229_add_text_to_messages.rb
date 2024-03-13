class AddTextToMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :text, :string
  end
end
