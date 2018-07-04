Fabricator(:course) do
  name    'Intro To Government'
  teacher { Fabricate(:teacher) }
  code { sequence(:code) { |i| "#{i+1}INT#{i}" } }
end
