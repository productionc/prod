class AddStreamIdToEventDepartments < ActiveRecord::Migration
  def change
    add_column :event_departments, :stream_id, :integer
  end
end
