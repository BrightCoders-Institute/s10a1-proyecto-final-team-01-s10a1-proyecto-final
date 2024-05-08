class RemoveReceiverIdFromMessages < ActiveRecord::Migration[7.1]
  def change
    remove_column :messages, :receiver_id, :bigint
  end
end
