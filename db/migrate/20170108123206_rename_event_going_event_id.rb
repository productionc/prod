class RenameEventGoingEventId < ActiveRecord::Migration
  def change
    rename_column :event_goings, :event__id, :event_id
  end
end
