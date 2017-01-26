class AddSlugRefToClassPages < ActiveRecord::Migration[5.0]
  def change
    add_column :class_pages, :slug_ref, :string
  end
end
