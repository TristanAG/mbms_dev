class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :class_name
      t.string :student_name

      t.timestamps
    end
  end
end
