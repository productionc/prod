class RevertRenameInEventDepartmentsStreamId < ActiveRecord::Migration
  def change
   rename_column :event_departments, :event_department_stream_id, :stream_id
  end
end
