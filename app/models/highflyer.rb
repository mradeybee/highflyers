class Highflyer < Student
  default_scope {
    joins(:student_courses).joins(teachers: :teacher_ratings)
    .where('student_courses.score >= ? AND teacher_ratings.rating >= ?', 80, 4)
    .order("student_courses.score asc")
  }

  def self.at_possision(number)
    position = number.is_a?(String) ? number.to_i : number
    offset(position - 1).first
  end

  def self.rate_teacher(teacher_id:, rating:, number:)
    teacher = Teacher.find_by_id(teacher_id)
    student_id = at_possision(number)&.id
    rating_point = rating.to_i <= 2 ? rating.to_i * 2 : 5
    TeacherRating.create(student_id: student_id, teacher: teacher, rating: rating_point)
  end
end
