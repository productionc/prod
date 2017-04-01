class RenameDepartmentPreferenceFields < ActiveRecord::Migration
  def change
    rename_column :department_preferences, :stream, :event_department_stream_id
    change_column :department_preferences, :event_department_stream_id, 'integer USING CAST(event_department_stream_id AS integer)'
    rename_column :department_preferences, :department, :event_department_id
    change_column :department_preferences, :event_department_id, 'integer USING CAST(event_department_id AS integer)'
  end
end
