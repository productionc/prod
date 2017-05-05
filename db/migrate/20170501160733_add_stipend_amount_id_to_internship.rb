class AddStipendAmountIdToInternship < ActiveRecord::Migration
  def change
    add_column :internships, :stipend_amount_id, :integer
  end
end
