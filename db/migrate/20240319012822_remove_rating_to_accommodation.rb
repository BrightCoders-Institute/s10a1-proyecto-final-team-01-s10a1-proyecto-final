class RemoveRatingToAccommodation < ActiveRecord::Migration[7.1]
  def change
    remove_column :accommodations, :rating
  end
end
