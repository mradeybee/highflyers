Fabricator(:teacher) do
  name  "Anderson Pamela"
  email { sequence(:email) { |i| "teacher#{i}@email.com" } }
end
