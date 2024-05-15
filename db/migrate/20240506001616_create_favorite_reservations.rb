class CreateFavoriteReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :favorite_reservations, primary_key: [:user_id, :reservation_id] do |t|
      t.references :user, null: false, foreign_key: true
      t.references :reservation, null: false, foreign_key: true
      t.boolean :favorite, null: false, default: false

      t.timestamps
    end
  end
end
