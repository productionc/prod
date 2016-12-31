class CreateEventCollegeBanners < ActiveRecord::Migration
  def change
    create_table :event_college_banners do |t|
      t.attachment :college

      t.timestamps null: false
    end
  end
end
