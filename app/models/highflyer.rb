class Highflyer < Student
  default_scope do
    joins(:student_courses)
      .joins(teachers: :teacher_ratings)
      .having('AVG(teacher_ratings.rating) >= 1')
      .group('students.id, student_courses.id')
      .where('student_courses.score >= 80')
      .order('student_courses.score')
  end

  def self.at_position(number)
    
    position = number.is_a?(String) ? number.to_i : number
    offset(position - 1).first
  end

  def self.rate_teacher(teacher_id:, rating:, id:)
    teacher = Teacher.find_by_id(teacher_id)
    student_id = at_position(id).try(:id)
    TeacherRating.create(student_id: student_id, teacher: teacher, rating: rating)
  end
end
