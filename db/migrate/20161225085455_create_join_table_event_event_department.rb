class CreateJoinTableEventEventDepartment < ActiveRecord::Migration
  def change
    create_join_table :events, :event_departments do |t|
      # t.index [:event_id, :event_department_id]
      # t.index [:event_department_id, :event_id]
    end
  end
end
