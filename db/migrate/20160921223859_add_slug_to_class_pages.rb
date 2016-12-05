class AddSlugToClassPages < ActiveRecord::Migration[5.0]
  def change
    add_column :class_pages, :slug, :string
    add_index :class_pages, :slug
  end
end
