json.array!(@students) do |student|
  json.extract! student, :id, :class_name, :student_name
  json.url student_url(student, format: :json)
end
