json.array!(@requests) do |request|
  json.extract! request, :id, :type, :status
  json.url request_url(request, format: :json)
end
