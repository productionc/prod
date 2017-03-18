class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.integer :preference_type_id
      t.integer :user_id
      t.string :event_type
      t.string :country
      t.string :state
      t.string :city
      t.string :stream
      t.string :department

      t.timestamps null: false
    end
  end
end
