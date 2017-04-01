class CreateBasicPages < ActiveRecord::Migration[5.0]
  def change
    create_table :basic_pages do |t|
      t.text :page_content

      t.timestamps
    end
  end
end
