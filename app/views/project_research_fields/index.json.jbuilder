json.array!(@project_research_fields) do |project_research_field|
  json.extract! project_research_field, :id
  json.url project_research_field_url(project_research_field, format: :json)
end
