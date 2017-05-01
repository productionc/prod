class ChangeInternshipColumnTypes < ActiveRecord::Migration
  def change
   change_column :internships, :certificate, 'boolean USING CAST(certificate AS boolean)'
   change_column :internships, :pre_placement, 'boolean USING CAST(pre_placement AS boolean)'
  end
end
