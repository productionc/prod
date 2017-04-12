class RenameFieldsInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :dept, :event_department_id
    rename_column :users, :stream, :event_department_stream_id
  end
end
