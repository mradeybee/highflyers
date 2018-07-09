class TeacherSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :created_at, :updated_at

  attribute :average_rating
  attribute :teacher_ratings
  attribute :students
  attribute :courses

  def average_rating
    object.teacher_ratings.average(:rating).to_f
  end

  def teacher_ratings
    object.teacher_ratings.map do |rating|
      student = rating.student
      {
        id: rating.id, rating: rating.rating,
        submited_by: { id: student.id,
                       name: student.name,
                       email: student.email }
      }
    end
  end

  def students
    object.students.map do |student|
      {
        id: student.id,
        name: student.name,
        email: student.email
      }
    end
  end

  def courses
    course = object.courses.map do |course|
      {
        id: course.id,
        name: course.name,
        code: course.code
      }
    end
  end
end
