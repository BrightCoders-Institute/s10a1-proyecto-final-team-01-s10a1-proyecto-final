class AddDatesRangeInReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :dates_range, :string, null: false
  end
end
