class RenameEventDepartmentStreamId < ActiveRecord::Migration
  def change
    rename_column :event_departments, :stream_id, :event_department_stream_id
    change_column :event_departments, :event_department_stream_id, 'integer USING CAST(event_department_stream_id AS integer)'
  end
end
