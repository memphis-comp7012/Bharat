json.array!(@iterations) do |iteration|
  json.extract! iteration, :id, :name
  json.url iteration_url(iteration, format: :json)
end
