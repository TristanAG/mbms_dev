class RemovePreviousExperienceOptionsFromStudents < ActiveRecord::Migration[5.0]
  def change
    remove_column :students, :previous_experience_first_option, :string
    remove_column :students, :previous_experience_second_option, :string
  end
end
