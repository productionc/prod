class CreateEventUrls < ActiveRecord::Migration
  def change
    create_table :event_urls do |t|
      t.string :web_link
      t.string :registration_link
      t.string :college_link
      t.string :facebook_link
      t.string :twitter_link
      t.string :youtube_link
      t.string :apps_link

      t.timestamps null: false
    end
  end
end
