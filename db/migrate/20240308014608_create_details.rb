class CreateDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :details do |t|
      t.references :accommodation, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
