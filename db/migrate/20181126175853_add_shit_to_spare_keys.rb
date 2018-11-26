class AddShitToSpareKeys < ActiveRecord::Migration[5.1]
  def change
    remove_column :spare_keys, :keycode
    change_column_null :spare_keys, :student_id, true
  end
end
