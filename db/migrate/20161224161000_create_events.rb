class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_no
      t.string :event_name
      t.string :event_type
      t.string :study_place
      t.string :country
      t.string :state
      t.string :district
      t.string :zip
      t.string :location
      t.integer :event_detail_id

      t.timestamps null: false
    end
  end
end
