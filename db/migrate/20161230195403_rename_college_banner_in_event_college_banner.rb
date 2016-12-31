class RenameCollegeBannerInEventCollegeBanner < ActiveRecord::Migration
  def change
    rename_column :event_college_banners, :college_file_name, :college_banner_file_name
    rename_column :event_college_banners, :college_file_size, :college_banner_file_size
    rename_column :event_college_banners, :college_content_type, :college_banner_content_type
    rename_column :event_college_banners, :college_updated_at, :college_banner_updated_at   
  end
end
