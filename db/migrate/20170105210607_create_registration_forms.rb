class CreateRegistrationForms < ActiveRecord::Migration[5.0]
  def change
    create_table :registration_forms do |t|
      t.string :class_name
      t.string :student_name
      t.string :student_email

      t.timestamps
    end
  end
end
