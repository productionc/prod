class RemoveInternshipIdFromStipendAmount < ActiveRecord::Migration
  def change
    remove_column :stipend_amounts, :internship_id
  end
end
