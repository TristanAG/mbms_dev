class AddShopifyButtonToClassPages < ActiveRecord::Migration[5.0]
  def change
    add_column :class_pages, :shopify_button, :text
  end
end
