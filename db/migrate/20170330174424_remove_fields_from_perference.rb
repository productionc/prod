class RemoveFieldsFromPerference < ActiveRecord::Migration
  def change
    remove_column :preferences, :event_type
    remove_column :preferences, :country
    remove_column :preferences, :state
    remove_column :preferences, :city
    remove_column :preferences, :stream
    remove_column :preferences, :department
  end
end
