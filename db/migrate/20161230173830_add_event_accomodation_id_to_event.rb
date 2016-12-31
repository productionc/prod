class AddEventAccomodationIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :event_accomodation_id, :integer
  end
end
