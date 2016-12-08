class AddStartTimeToClassPages < ActiveRecord::Migration[5.0]
  def change
    add_column :class_pages, :start_time, :datetime
  end
end
