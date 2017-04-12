class ChangeUsersTblFieldsType < ActiveRecord::Migration
  def change
    change_column :users, :event_department_id, 'integer USING CAST(event_department_id AS integer)'
    change_column :users, :event_department_stream_id, 'integer USING CAST(event_department_stream_id AS integer)'
  end
end
