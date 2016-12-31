class CreateEventDetails < ActiveRecord::Migration
  def change
    create_table :event_details do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.text :event_description
      t.text :sub_events
      t.text :workshops
      t.text :paper_presentation_topics
      t.text :conference_topics

      t.timestamps null: false
    end
  end
end
