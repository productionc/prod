class AddAuthValueToUser < ActiveRecord::Migration
  def change
    add_column :users, :auth_value, :string
  end
end
