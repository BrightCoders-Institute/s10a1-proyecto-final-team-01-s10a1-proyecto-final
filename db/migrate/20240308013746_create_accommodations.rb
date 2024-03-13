class CreateAccommodations < ActiveRecord::Migration[7.1]
  def change
    create_table :accommodations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.decimal :price_per_day
      t.string :rules
      t.string :description
      t.integer :rating
      t.date :start_date
      t.date :end_date
      t.integer :bedrooms_number
      t.integer :bathrooms_number
      t.integer :beds_number
      t.integer :max_guests_number

      t.timestamps
    end
  end
end
