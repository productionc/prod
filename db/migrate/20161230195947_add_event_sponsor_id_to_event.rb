class AddEventSponsorIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :event_sponsor_id, :integer
  end
end
