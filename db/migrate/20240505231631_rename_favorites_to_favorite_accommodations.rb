class RenameFavoritesToFavoriteAccommodations < ActiveRecord::Migration[7.1]
  def change
    rename_table :favorites, :favorite_accommodations
  end
end
