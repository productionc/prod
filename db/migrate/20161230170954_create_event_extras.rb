class CreateEventExtras < ActiveRecord::Migration
  def change
    create_table :event_extras do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
