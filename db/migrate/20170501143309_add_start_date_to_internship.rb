class AddStartDateToInternship < ActiveRecord::Migration
  def change
    add_column :internships, :start_date, :datetime
  end
end
