class AddEventUrlIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :event_url_id, :integer
  end
end
