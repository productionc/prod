class ChangeStartDateType < ActiveRecord::Migration
  def change
    change_column :internships, :start_date, 'date USING CAST(start_date AS date)'
  end
end
