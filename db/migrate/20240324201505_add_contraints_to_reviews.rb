class AddContraintsToReviews < ActiveRecord::Migration[7.1]
  def change
    change_column :reviews, :title, :string, null: false, limit: 100
    change_column :reviews, :rating, :integer, null: false
  end
end
