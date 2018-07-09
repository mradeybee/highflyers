class StudentsController < ApplicationController
  def index
    render json: Student.all,
           each_serializer: StudentSerializer,
           status: :ok
  end

  def create
    student = Student.create(students_params)

    if student.errors.present?
      render(
        json: { errors: student.errors.full_messages.join(', ') },
        status: :unprocessable_entity
      )
    else
      render json: student, serializer: StudentSerializer, status: :created
    end
  end

  def rate_teacher
    rating = teacher_rating

    if rating.errors.present?
      render(
        json: { errors: rating.errors.full_messages.join(', ') },
        status: :unprocessable_entity
      )
    else
      render json: rating, serializer: TeacherRatingSerializer, status: :created
    end
  end

  private

  def students_params
    params.permit(:id, :name, :email, :course_id)
  end

  def teacher_rating_params
    params.permit(:rating, :teacher_id)
  end

  def teacher_rating
    TeacherRating.create(
      student_id: students_params[:id],
      teacher_id: teacher_rating_params[:teacher_id],
      rating: teacher_rating_params[:rating]
    )
  end
end
