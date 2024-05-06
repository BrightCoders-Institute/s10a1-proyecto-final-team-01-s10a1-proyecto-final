class CreateFavorites < ActiveRecord::Migration[7.1]
  def change
    create_table :favorites, primary_key: [:user_id, :accommodation_id] do |t|
      t.references :user, null: false, foreign_key: true
      t.references :accommodation, null: false, foreign_key: true
      t.boolean :favorite, null: false, default: false

      t.timestamps
    end
  end
end
