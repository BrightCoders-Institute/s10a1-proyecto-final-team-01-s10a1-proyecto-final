class CreateFavoritePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :favorite_posts, primary_key: [:user_id, :post_id] do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.boolean :favorite, null: false, default: false

      t.timestamps
    end
  end
end
