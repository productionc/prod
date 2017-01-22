class AddDeptStreamToEvent < ActiveRecord::Migration
  def change
    add_column :events, :dept_stream, :string
  end
end
