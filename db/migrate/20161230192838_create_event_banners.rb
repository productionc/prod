class CreateEventBanners < ActiveRecord::Migration
  def change
    create_table :event_banners do |t|
      t.attachment :banner

      t.timestamps null: false
    end
  end
end
