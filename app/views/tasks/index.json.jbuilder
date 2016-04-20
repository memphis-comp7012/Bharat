json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :description, :status, :assigned_user, :due_date
  json.url task_url(task, format: :json)
end
