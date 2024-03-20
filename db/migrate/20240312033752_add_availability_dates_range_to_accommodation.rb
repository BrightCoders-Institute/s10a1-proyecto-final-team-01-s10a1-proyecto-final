class AddAvailabilityDatesRangeToAccommodation < ActiveRecord::Migration[7.1]
  def change
    add_column :accommodations, :dates_range, :string
  end
end
