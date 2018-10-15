class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.timestamp :start_date
      t.timestamp :end_date
      t.boolean :recurring
      t.integer :room_id

      t.timestamps
    end
  end
end
