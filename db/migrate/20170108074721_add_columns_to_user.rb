class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :dept, :string
    add_column :users, :official_email_id, :string
    add_column :users, :company, :string
  end
end
