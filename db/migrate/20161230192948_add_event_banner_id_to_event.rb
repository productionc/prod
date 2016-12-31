class AddEventBannerIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :event_banner_id, :integer
  end
end
