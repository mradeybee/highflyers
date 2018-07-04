class StudentsController < ApplicationController
  def index
    students = Student.all
    render json: {students: students}, status: :ok
  end

  def create
    student = Student.create(students_params)

    if student.errors.present?
      render json: {errors: student.errors.full_messages.join(', ')}, status: :unprocessable_entity
    else
      render json: {student: student}, status: :created
    end
  end

  private

  def students_params
    params.permit(:id, :name, :email)
  end
end
