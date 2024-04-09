class AddContraintsToPosts < ActiveRecord::Migration[7.1]
  def change
    change_column :posts, :title, :string, null: false, limit: 100
  end
end
