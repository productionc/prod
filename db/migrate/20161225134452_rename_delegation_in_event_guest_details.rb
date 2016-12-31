class RenameDelegationInEventGuestDetails < ActiveRecord::Migration
  def change
  	rename_column :event_guest_details, :Delegation, :delegation
  end
end
