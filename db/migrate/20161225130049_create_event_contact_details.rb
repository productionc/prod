class CreateEventContactDetails < ActiveRecord::Migration
  def change
    create_table :event_contact_details do |t|
      t.string :designation
      t.string :name
      t.string :email
      t.string :phone_no
      t.string :general_support

      t.timestamps null: false
    end
  end
end
