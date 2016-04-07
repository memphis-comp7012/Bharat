json.array!(@profile_research_fields) do |profile_research_field|
  json.extract! profile_research_field, :id
  json.url profile_research_field_url(profile_research_field, format: :json)
end
