# frozen_string_literal: true

json.array! @students do |student|
  json.label student.name
  json.id student.id
end
