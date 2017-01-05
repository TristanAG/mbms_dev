class DropRegistrationFormsTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :registration_forms
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
