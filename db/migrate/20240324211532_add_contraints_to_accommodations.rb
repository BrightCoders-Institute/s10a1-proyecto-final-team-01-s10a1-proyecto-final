class AddContraintsToAccommodations < ActiveRecord::Migration[7.1]
  def change
    change_column :accommodations, :title, :string, null: false, limit: 100
    change_column :accommodations, :price_per_day, :decimal, null: false
    change_column :accommodations, :bedrooms_number, :integer, null: false
    change_column :accommodations, :bathrooms_number, :integer, null: false
    change_column :accommodations, :beds_number, :integer, null: false
    change_column :accommodations, :max_guests_number, :integer, null: false
    change_column :accommodations, :address, :string, null: false
    change_column :accommodations, :dates_range, :string, null: false
  end
end
