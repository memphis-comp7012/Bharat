json.array!(@projects) do |project|
  json.extract! project, :id, :name, :status, :description, :start_date, :end_date, :funding, :difficulty_level
  json.url project_url(project, format: :json)
end
