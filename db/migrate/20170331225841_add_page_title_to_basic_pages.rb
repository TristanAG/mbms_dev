class AddPageTitleToBasicPages < ActiveRecord::Migration[5.0]
  def change
    add_column :basic_pages, :page_title, :string
  end
end
