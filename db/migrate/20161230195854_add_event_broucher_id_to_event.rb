class AddEventBroucherIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :event_broucher_id, :integer
  end
end
