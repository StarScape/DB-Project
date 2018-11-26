class AddCheckoutinfoToSpareKeys < ActiveRecord::Migration[5.1]
  def change
    add_column :spare_keys, :checked_out, :boolean
    add_column :spare_keys, :student_id, :integer
  end
end
