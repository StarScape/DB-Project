class RemoveStringFromDas < ActiveRecord::Migration[5.1]
  def change
    remove_column :das, :string
  end
end
