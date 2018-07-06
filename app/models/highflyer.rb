class Highflyer < Student
  default_scope {
    joins(:student_courses).joins(teachers: :teacher_ratings)
    .where('student_courses.score >= ? AND (SELECT AVG(rating) FROM teacher_ratings) >= ?', 80, 1)
    .order('student_courses.score')
  }

  def self.at_position(number)
    position = number.is_a?(String) ? number.to_i : number
    offset(position - 1).first
  end
end
