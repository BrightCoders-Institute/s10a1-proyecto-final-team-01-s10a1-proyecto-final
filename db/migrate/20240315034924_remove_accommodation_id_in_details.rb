class RemoveAccommodationIdInDetails < ActiveRecord::Migration[7.1]
  def change
    remove_column :details, :accommodation_id
  end
end
