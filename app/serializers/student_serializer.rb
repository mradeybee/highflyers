class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  attribute :courses

  def courses
    object.student_courses.map do |student_course|
      course = student_course.course
      teacher = course.teacher

      {
        id: course.id,
        name: course.name,
        code: course.code,
        course_score: student_course.score,
        teacher: {
          id: teacher.id,
          name: teacher.name,
          email: teacher.email,
          average_rating: teacher.teacher_ratings.average(:rating).to_f
        }
      }
    end
  end
end
