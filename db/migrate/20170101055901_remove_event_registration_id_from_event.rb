class RemoveEventRegistrationIdFromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :event_registration_id
  end
end
