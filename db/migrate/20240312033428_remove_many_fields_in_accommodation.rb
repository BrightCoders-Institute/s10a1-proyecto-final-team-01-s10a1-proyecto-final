class RemoveManyFieldsInAccommodation < ActiveRecord::Migration[7.1]
  def change
    remove_column :accommodations, :rules
    remove_column :accommodations, :description
    remove_column :accommodations, :start_date
    remove_column :accommodations, :end_date
  end
end
