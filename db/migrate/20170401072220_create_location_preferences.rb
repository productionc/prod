class CreateLocationPreferences < ActiveRecord::Migration
  def change
    create_table :location_preferences do |t|
      t.string :country
      t.string :state
      t.string :district
      t.integer :preference_id

      t.timestamps null: false
    end
  end
end
