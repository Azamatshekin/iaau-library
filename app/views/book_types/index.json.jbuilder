json.array!(@book_types) do |book_type|
  json.extract! book_type, :id, :name, :author, :publish_year, :price
  json.url book_type_url(book_type, format: :json)
end
