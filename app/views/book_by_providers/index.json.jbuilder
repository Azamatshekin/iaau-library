json.array!(@book_by_providers) do |book_by_provider|
  json.extract! book_by_provider, :id, :date
  json.url book_by_provider_url(book_by_provider, format: :json)
end
