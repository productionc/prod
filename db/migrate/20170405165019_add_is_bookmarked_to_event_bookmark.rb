class AddIsBookmarkedToEventBookmark < ActiveRecord::Migration
  def change
    add_column :event_bookmarks, :is_bookmarked, :boolean, default: false
  end
end
