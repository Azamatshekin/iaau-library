json.array!(@providers) do |provider|
  json.extract! provider, :id, :fullname, :email, :phone
  json.url provider_url(provider, format: :json)
end
