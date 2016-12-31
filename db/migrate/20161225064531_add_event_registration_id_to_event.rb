class AddEventRegistrationIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :event_registration_id, :integer
  end
end
