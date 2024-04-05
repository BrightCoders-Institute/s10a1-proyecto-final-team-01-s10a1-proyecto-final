class RemoveSeparateDatesInReservations < ActiveRecord::Migration[7.1]
  def change
    remove_column :reservations, :start_date
    remove_column :reservations, :end_date
  end
end
