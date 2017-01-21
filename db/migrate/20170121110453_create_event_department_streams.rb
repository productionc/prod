class CreateEventDepartmentStreams < ActiveRecord::Migration
  def change
    create_table :event_department_streams do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
