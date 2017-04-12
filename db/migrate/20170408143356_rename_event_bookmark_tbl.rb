class RenameEventBookmarkTbl < ActiveRecord::Migration
  def change
    rename_table :event_bookmarks, :event_favourites
  end
end
