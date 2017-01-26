class AddFirstInstanceToClassPages < ActiveRecord::Migration[5.0]
  def change
    add_column :class_pages, :first_instance, :boolean
  end
end
