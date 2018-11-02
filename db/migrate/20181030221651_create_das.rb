class CreateDas < ActiveRecord::Migration[5.1]
  def change
    create_table :das do |t|
      t.string :email
      t.string :name
      t.string :password
      t.string :string

      t.timestamps
    end
  end
end
