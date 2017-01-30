class AddIncludeSignUpButtonToClassPages < ActiveRecord::Migration[5.0]
  def change
    add_column :class_pages, :include_sign_up, :boolean
  end
end
