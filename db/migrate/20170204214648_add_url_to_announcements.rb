class AddUrlToAnnouncements < ActiveRecord::Migration[5.0]
  def change
    add_column :announcements, :url, :string
  end
end
