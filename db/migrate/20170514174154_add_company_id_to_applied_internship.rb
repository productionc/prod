class AddCompanyIdToAppliedInternship < ActiveRecord::Migration
  def change
    add_column :applied_internships, :company_id, :integer
  end
end
