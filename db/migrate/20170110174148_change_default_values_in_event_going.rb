class ChangeDefaultValuesInEventGoing < ActiveRecord::Migration
  def change
    change_column :event_goings, :may_be_count, :integer, :default => 0
    change_column :event_goings, :going_count, :integer, :default => 0
    change_column :event_goings, :reach_count, :integer, :default => 0
  end
end
