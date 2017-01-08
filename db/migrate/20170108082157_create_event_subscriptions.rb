class CreateEventSubscriptions < ActiveRecord::Migration
  def change
    create_table :event_subscriptions do |t|
      t.string :email_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
