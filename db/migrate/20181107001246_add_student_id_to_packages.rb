class AddStudentIdToPackages < ActiveRecord::Migration[5.1]
  def change
    add_column :packages, :student_id, :integer
  end
end
