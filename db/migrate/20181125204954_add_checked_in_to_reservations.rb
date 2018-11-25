class AddCheckedInToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :checked_in, :boolean
  end
end
