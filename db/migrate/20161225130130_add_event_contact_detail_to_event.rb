class AddEventContactDetailToEvent < ActiveRecord::Migration
  def change
    add_column :events, :event_contact_detail_id, :integer
  end
end
