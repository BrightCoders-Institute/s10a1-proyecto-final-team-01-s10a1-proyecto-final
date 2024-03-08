class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.references :transferrable_as, foreign_key: { to_table: 'users' }
      t.references :same_as, foreign_key: { to_table: 'courses' }
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
