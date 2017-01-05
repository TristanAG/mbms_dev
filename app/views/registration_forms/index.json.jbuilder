json.array!(@registration_forms) do |registration_form|
  json.extract! registration_form, :id, :class_name, :student_name, :student_email
  json.url registration_form_url(registration_form, format: :json)
end
