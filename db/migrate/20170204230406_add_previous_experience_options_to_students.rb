class AddPreviousExperienceOptionsToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :previous_experience_first_option, :string
    add_column :students, :previous_experience_second_option, :string
  end
end
