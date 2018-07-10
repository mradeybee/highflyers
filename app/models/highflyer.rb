class Highflyer < Student
  self.table_name = 'high_flyer'

  def self.at_position(number)
    position = number.is_a?(String) ? number.to_i : number
    offset(position - 1).first
  end

  def self.rate_teacher(teacher_id:, rating:, id:)
    TeacherRating.create(student_id: at_position(id).try(:id),
                         teacher: Teacher.find_by_id(teacher_id),
                         rating: rating)
  end

  protected

  def readonly?
    true
  end
end
