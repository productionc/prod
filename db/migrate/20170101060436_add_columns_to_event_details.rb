class AddColumnsToEventDetails < ActiveRecord::Migration
  def change
    add_column :event_details, :reg_start_date, :datetime
    add_column :event_details, :reg_end_date, :datetime
    add_column :event_details, :reg_fee, :text
  end
end
