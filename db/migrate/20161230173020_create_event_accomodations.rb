class CreateEventAccomodations < ActiveRecord::Migration
  def change
    create_table :event_accomodations do |t|
      t.boolean :accomodation

      t.timestamps null: false
    end
  end
end
