class AddFieldsToClassPages < ActiveRecord::Migration[5.0]
  def change
    add_column :class_pages, :sign_up_info, :text
  end
end
