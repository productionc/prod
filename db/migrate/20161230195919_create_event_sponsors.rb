class CreateEventSponsors < ActiveRecord::Migration
  def change
    create_table :event_sponsors do |t|
      t.attachment :sponsor

      t.timestamps null: false
    end
  end
end
