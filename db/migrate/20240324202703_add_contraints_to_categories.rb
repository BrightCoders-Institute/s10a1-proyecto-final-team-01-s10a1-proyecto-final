class AddContraintsToCategories < ActiveRecord::Migration[7.1]
  def change
    change_column :categories, :name, :string, null: false
  end
end
