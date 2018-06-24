class CreateBookmarksTagsJoin < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks_tags, :id => false do |t|
    t.integer "bookmark_id"
    t.integer "tag_id"
  end
    add_index("bookmarks_tags", ["bookmark_id", "tag_id"])
  end
end
