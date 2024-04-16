class RenameNameToTitleInAccommodation < ActiveRecord::Migration[7.1]
  def change
    rename_column :accommodations, :name, :title
  end
end
