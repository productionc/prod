class CreateEventGuestDetails < ActiveRecord::Migration
  def change
    create_table :event_guest_details do |t|
      t.string :name
      t.string :designation
      t.string :company
      t.string :Delegation
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
