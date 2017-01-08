class AddEventIdToEventSponsor < ActiveRecord::Migration
  def change
    add_column :event_sponsors, :event_id, :integer
  end
end
