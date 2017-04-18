class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.string :duration
      t.string :summary

      t.timestamps null: false
    end
  end
end
