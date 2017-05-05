class AddInternshipIdToStipendAmount < ActiveRecord::Migration
  def change
    add_column :stipend_amounts, :internship_id, :integer
  end
end
