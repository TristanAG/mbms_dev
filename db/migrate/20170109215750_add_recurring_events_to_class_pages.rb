class AddRecurringEventsToClassPages < ActiveRecord::Migration[5.0]
  def change
    add_column :class_pages, :recurring_event, :boolean
  end
end
