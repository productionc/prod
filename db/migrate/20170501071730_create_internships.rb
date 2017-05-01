class CreateInternships < ActiveRecord::Migration
  def change
    create_table :internships do |t|
      t.string :title
      t.string :no_of_openings
      t.string :category
      t.string :start_date
      t.string :country
      t.string :state
      t.string :district
      t.integer :job_type_id
      t.string :duration
      t.string :skills
      t.integer :stipend_type_id
      t.integer :stipend_amount_id
      t.string :certificate
      t.string :pre_placement
      t.string :description

      t.timestamps null: false
    end
  end
end
