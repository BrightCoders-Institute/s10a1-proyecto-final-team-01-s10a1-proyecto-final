class RemoveTests < ActiveRecord::Migration[7.1]
  def change
    drop_table :tests
  end
end
