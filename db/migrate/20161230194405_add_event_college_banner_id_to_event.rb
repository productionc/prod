class AddEventCollegeBannerIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :event_college_banner_id, :integer
  end
end
