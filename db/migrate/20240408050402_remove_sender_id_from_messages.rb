class RemoveSenderIdFromMessages < ActiveRecord::Migration[7.1]
  def change
    remove_column :messages, :sender_id, :bigint
  end
end
