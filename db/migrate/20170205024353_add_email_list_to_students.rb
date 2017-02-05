class AddEmailListToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :email_list, :string
  end
end
