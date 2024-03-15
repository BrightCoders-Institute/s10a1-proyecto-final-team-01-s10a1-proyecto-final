class AddLocationDataToTest < ActiveRecord::Migration[7.1]
  def change
    add_column :tests, :address, :string
    add_column :tests, :latitude, :decimal, precision: 10, scale: 6
    add_column :tests, :longitude, :decimal, precision: 10, scale: 6
  end
end
