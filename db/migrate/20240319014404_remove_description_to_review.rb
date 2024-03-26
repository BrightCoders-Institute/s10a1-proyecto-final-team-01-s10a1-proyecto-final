class RemoveDescriptionToReview < ActiveRecord::Migration[7.1]
  def change
    remove_column :reviews, :description
  end
end
