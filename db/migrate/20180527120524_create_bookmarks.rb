class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.string :url, null: false
      t.string :screenshot, null: false
      t.string :title
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
