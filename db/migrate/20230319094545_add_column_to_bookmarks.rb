class AddColumnToBookmarks < ActiveRecord::Migration[7.0]
  def change
    add_column :bookmarks, :title, :string
  end
end
