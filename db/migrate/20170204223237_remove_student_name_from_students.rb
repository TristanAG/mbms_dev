class RemoveStudentNameFromStudents < ActiveRecord::Migration[5.0]
  def change
    remove_column :students, :student_name, :string
  end
end
