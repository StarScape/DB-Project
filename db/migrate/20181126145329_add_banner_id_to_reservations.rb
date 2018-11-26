class AddBannerIdToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :banner_id, :integer
  end
end
