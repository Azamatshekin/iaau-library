json.array!(@book_in_uses) do |book_in_use|
  json.extract! book_in_use, :id, :fromDate, :toDate, :returnDate
  json.url book_in_use_url(book_in_use, format: :json)
end
