class CreateAccommodationsDetailsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :accommodations_details do |t|
      t.references :accommodation, null: false, foreign_key: true
      t.references :detail, null: false, foreign_key: true

      t.timestamps
    end
  end
end
