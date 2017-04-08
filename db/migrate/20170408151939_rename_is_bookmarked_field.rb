class RenameIsBookmarkedField < ActiveRecord::Migration
  def change
   rename_column :event_favourites, :is_bookmarked, :is_favourite
  end
end
