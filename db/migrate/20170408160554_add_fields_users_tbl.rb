class AddFieldsUsersTbl < ActiveRecord::Migration
  def change
   add_column :users, :stream, :string
   add_column :users, :know_us, :string
  end
end
