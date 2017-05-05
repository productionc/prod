class ChangeStartDateTypeColumn < ActiveRecord::Migration
  def change
   remove_column :internships, :start_date
  end
end
