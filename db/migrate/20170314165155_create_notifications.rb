class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :notification_type_id
      t.string :message

      t.timestamps null: false
    end
  end
end
