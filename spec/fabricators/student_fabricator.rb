Fabricator(:student) do
  name  "Anderson Pompeo"
  email { sequence(:email) { |i| "student#{i}@email.com" } }
end
