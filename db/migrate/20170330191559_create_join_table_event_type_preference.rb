class CreateJoinTableEventTypePreference < ActiveRecord::Migration
  def change
    create_join_table :event_types, :preferences do |t|
      # t.index [:event_type_id, :preference_id]
      # t.index [:preference_id, :event_type_id]
    end
  end
end
