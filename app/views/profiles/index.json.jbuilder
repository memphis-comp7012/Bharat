json.array!(@profiles) do |profile|
  json.extract! profile, :id, :first_name, :last_name, :bio, :education_level, :phone_number, :summary_of_projects, :skills
  json.url profile_url(profile, format: :json)
end
