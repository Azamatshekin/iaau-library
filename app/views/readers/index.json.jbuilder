json.array!(@readers) do |reader|
  json.extract! reader, :id, :name, :surname, :email, :address, :passport, :birth_date, :photo
  json.url reader_url(reader, format: :json)
end
