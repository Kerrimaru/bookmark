class RemoveScreenshotFromBookmarks < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookmarks, :screenshot, :string
  end
end
