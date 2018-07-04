Fabricator(:teacher_rating) do
  student { Fabricate(:student) }
  teacher { Fabricate(:teacher) }
  rating   1
end
