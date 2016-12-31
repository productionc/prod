class RemoveEventContactDetailIdFromEvent < ActiveRecord::Migration
  def change
  	remove_column :events, :event_contact_detail_id
  end
end
