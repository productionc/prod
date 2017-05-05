class DeleteStipendAmountIdFromInternship < ActiveRecord::Migration
  def change
    remove_column :internships, :stipend_amount_id
  end
end
