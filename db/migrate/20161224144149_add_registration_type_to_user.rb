class AddRegistrationTypeToUser < ActiveRecord::Migration
  def change
    add_column :users, :registration_type, :string
  end
end
