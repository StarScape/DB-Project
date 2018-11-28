class AddPasswordDigestToDas < ActiveRecord::Migration[5.1]
  def change
    add_column :das, :password_digest, :string
  end
end
