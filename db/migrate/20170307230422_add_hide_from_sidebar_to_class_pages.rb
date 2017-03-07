class AddHideFromSidebarToClassPages < ActiveRecord::Migration[5.0]
  def change
    add_column :class_pages, :hide_from_sidebar, :boolean
  end
end
