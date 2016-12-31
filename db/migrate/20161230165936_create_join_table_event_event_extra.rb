class CreateJoinTableEventEventExtra < ActiveRecord::Migration
  def change
    create_join_table :events, :event_extras do |t|
      # t.index [:event_id, :event_extra_id]
      # t.index [:event_extra_id, :event_id]
    end
  end
end
