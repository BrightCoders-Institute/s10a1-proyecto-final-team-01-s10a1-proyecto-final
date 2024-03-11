class AddLocationDataToAccommodation < ActiveRecord::Migration[7.1]
  def change
    add_column :accommodations, :address, :string
    add_column :accommodations, :latitude, :decimal, precision: 10, scale: 6
    add_column :accommodations, :longitude, :decimal, precision: 10, scale: 6
  end
end
