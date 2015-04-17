json.array!(@books) do |book|
  json.extract! book, :id, :barcode, :INNcode
  json.url book_url(book, format: :json)
end
