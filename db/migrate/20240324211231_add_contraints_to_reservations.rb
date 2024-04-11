class AddContraintsToReservations < ActiveRecord::Migration[7.1]
  def change
    change_column :reservations, :active, :boolean, default: true
  end
end
