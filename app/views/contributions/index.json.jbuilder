json.array!(@contributions) do |contribution|
  json.extract! contribution, :id, :score, :money_received
  json.url contribution_url(contribution, format: :json)
end
