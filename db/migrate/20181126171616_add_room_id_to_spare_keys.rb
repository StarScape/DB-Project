class AddRoomIdToSpareKeys < ActiveRecord::Migration[5.1]
  def change
    add_column :spare_keys, :room_id, :integer
    remove_column :spare_keys, :barcode, :keycode
  end
end
