class AddRemainingFieldsToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :additional_info, :text
    add_column :students, :how_did_you_hear, :text
  end
end
