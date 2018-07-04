Fabricator(:user) do
  name  "Anderson Pamela"
  email { sequence(:email) { |i| "user#{i}@email.com" } }
  role { %w(student teacher).sample }
end

Fabricator(:student, from: :user, class_name: :student) do
  role { 'student' }
end


Fabricator(:teacher, from: :user, class_name: :teacher) do
  role { 'teacher' }
end