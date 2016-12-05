class CreateClassPages < ActiveRecord::Migration[5.0]
  def change
    create_table :class_pages do |t|
      t.string :class_title
      t.text :class_content
      t.integer :order_position

      t.timestamps
    end
  end
end
