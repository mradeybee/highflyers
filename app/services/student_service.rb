class StudentService
  attr_accessor :student_id

  def initialize(id)
    @student_id = id
  end

  def register_course(course_id)
    teacher_id = Course.find(course_id).teacher_id
    StudentCourse.create(student_id: student_id, course_id: course_id, teacher_id: teacher_id)
  end

  def score_student(params)
    student_course = StudentCourse.where(
      student_id: student_id,
      course_id: params[:course_id],
      teacher_id: params[:id]
    ).first

    student_course.update(score: params[:score])
    student_course.reload
  end
end
