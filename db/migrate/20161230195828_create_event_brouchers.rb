class CreateEventBrouchers < ActiveRecord::Migration
  def change
    create_table :event_brouchers do |t|
      t.attachment :broucher

      t.timestamps null: false
    end
  end
end
