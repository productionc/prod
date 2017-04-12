class CreateDepartmentPreferences < ActiveRecord::Migration
  def change
    create_table :department_preferences do |t|
      t.string :stream
      t.string :department
      t.integer :preference_id

      t.timestamps null: false
    end
  end
end
