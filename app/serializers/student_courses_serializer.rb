class StudentCoursesSerializer < ActiveModel::Serializer
  attributes :score

  attribute :teacher
  attribute :course
  attribute :student

  def student
    student = object.student
    {
      id: student.id,
      name: student.name,
      email: student.email
    }
  end

  def course
    course = object.course
    {
      id: course.id,
      name: course.name,
      code: course.code
    }
  end

  def teacher
    teacher = object.teacher
    {
      id: teacher.id,
      name: teacher.name,
      email: teacher.email,
      average_rating: object.teacher.teacher_ratings.average(:rating).to_f
    }
  end
end
