class RemovePasswordFromDas < ActiveRecord::Migration[5.1]
  def change
    remove_column :das, :password, :string
  end
end
