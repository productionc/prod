class CreateAppliedInternships < ActiveRecord::Migration
  def change
    create_table :applied_internships do |t|
      t.integer :internship_id
      t.integer :user_id
      t.string :internship_status

      t.timestamps null: false
    end
  end
end
