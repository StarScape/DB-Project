class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.boolean :received
      t.boolean :perishable
      t.timestamp :first_email
      t.timestamp :second_email

      t.timestamps
    end
  end
end
