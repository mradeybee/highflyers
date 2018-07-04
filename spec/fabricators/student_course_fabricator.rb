Fabricator(:student_course) do
  student { Fabricate(:student) }
  course  { Fabricate(:course) }
  teacher { Fabricate(:teacher) }
  score   1
end