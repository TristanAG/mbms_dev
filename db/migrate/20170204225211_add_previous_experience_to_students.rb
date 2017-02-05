class AddPreviousExperienceToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :previous_experience, :string
  end
end
