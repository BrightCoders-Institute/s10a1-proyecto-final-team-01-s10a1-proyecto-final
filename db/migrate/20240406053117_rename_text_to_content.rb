class RenameTextToContent < ActiveRecord::Migration[7.1]
  def change
    rename_column(:messages, :text, :content)
  end
end
