class CreateJoinTableEventDepartmentPreference < ActiveRecord::Migration
  def change
    create_join_table :event_departments, :preferences do |t|
      # t.index [:event_department_id, :preference_id]
      # t.index [:preference_id, :event_department_id]
    end
  end
end
