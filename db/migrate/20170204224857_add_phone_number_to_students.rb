class AddPhoneNumberToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :phone_number, :string
  end
end
