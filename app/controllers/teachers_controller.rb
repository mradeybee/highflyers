class TeachersController < ApplicationController
  def index
    render json: { teachers: Teacher.all }, status: :ok
  end

  def create
    teacher = Teacher.create(teachers_params)

    if teacher.errors.present?
      render(
        json: { errors: teacher.errors.full_messages.join(', ') },
        status: :unprocessable_entity
      )
    else
      render json: { teacher: teacher }, status: :created
    end
  end

  def score_student
    result = service.score_student(teachers_params)

    if result.errors.present?
      render(
        json: { errors: result.errors.full_messages.join(', ') },
        status: :unprocessable_entity
      )
    else
      render json: { result: result }, status: :created
    end
  end

  private

  def teachers_params
    params.permit(:id, :name, :email, :student_id, :score, :course_id)
  end

  def service
    StudentService.new(teachers_params[:student_id])
  end
end
