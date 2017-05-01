class CreateStipendTypes < ActiveRecord::Migration
  def change
    create_table :stipend_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
