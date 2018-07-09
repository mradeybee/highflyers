class CourseSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :created_at, :updated_at

  attribute :teacher
  attribute :students

  def teacher
    teacher = object.teacher
    {
      id: teacher.id,
      name: teacher.name,
      email: teacher.email,
      average_rating: object.teacher.teacher_ratings.average(:rating).to_f
    }
  end

  def students
    object.student_courses.map do |student_courses|
      student = student_courses.student

      {
        id: student.id,
        name: student.name,
        email: student.email,
        course_score: student_courses.score
      }
    end
  end
end
