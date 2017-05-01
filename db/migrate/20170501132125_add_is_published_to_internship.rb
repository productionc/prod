class AddIsPublishedToInternship < ActiveRecord::Migration
  def change
    add_column :internships, :is_published, :boolean, default: false
  end
end
