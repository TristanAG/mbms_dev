json.array!(@class_pages) do |class_page|
  json.extract! class_page, :id, :class_title, :class_content, :order_position
  json.url class_page_url(class_page, format: :json)
end
