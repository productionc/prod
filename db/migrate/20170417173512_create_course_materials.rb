class CreateCourseMaterials < ActiveRecord::Migration
  def change
    create_table :course_materials do |t|
      t.integer :course_id

      t.timestamps null: false
    end
  end
end
