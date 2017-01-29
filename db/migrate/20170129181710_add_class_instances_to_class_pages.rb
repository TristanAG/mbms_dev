class AddClassInstancesToClassPages < ActiveRecord::Migration[5.0]
  def change
    add_column :class_pages, :class_instances, :integer
  end
end
