class Highflyer < Student
  default_scope {
    joins(:student_courses)
      .joins(teachers: :teacher_ratings)
      .having('AVG(teacher_ratings.rating) >= 1')
      .group('students.id, student_courses.id')
      .where('student_courses.score >= 80')
      .order('student_courses.score')
  }

  def self.at_position(number)
    position = number.is_a?(String) ? number.to_i : number
    offset(position - 1).first
  end
end
