class CreateStipendAmounts < ActiveRecord::Migration
  def change
    create_table :stipend_amounts do |t|
      t.string :amount
      t.string :amount_lower_limit
      t.string :amount_upper_limit
      t.string :incentive_amount
      t.string :incentive_type

      t.timestamps null: false
    end
  end
end
