class CreateEventGoings < ActiveRecord::Migration
  def change
    create_table :event_goings do |t|
      t.integer :event__id
      t.integer :user_id
      t.integer :may_be_count
      t.integer :going_count
      t.integer :reach_count

      t.timestamps null: false
    end
  end
end
