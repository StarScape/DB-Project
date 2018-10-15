class CreateSpareKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :spare_keys do |t|
      t.string :barcode
      t.string :keycode

      t.timestamps
    end
  end
end
