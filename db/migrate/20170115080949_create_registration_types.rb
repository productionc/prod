class CreateRegistrationTypes < ActiveRecord::Migration
  def change
    create_table :registration_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
