class CreateEventRegistrations < ActiveRecord::Migration
  def change
    create_table :event_registrations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.text :fee

      t.timestamps null: false
    end
  end
end
