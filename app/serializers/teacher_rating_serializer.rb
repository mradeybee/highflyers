class TeacherRatingSerializer < ActiveModel::Serializer
  attributes :rating

  attribute :teacher
  attribute :student

  def student
    student = object.student
    {
      id: student.id,
      name: student.name,
      email: student.email
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
