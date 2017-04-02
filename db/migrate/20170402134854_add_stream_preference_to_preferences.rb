class AddStreamPreferenceToPreferences < ActiveRecord::Migration
  def change
    add_column :preferences, :stream_preference, :string
  end
end
