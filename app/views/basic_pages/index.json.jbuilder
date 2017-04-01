json.array!(@basic_pages) do |basic_page|
  json.extract! basic_page, :id, :page_content
  json.url basic_page_url(basic_page, format: :json)
end
