class AddEventIdToEventContactDetail < ActiveRecord::Migration
  def change
    add_column :event_contact_details, :event_id, :integer
  end
end
