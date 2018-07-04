class TeachersController < ApplicationController
  def index
    teachers = Teacher.all
    render json: {teachers: teachers}, status: :ok
  end

  def create
    teacher = Teacher.create(teachers_params)

    if teacher.errors.present?
      render json: {errors: teacher.errors.full_messages.join(', ')}, status: :unprocessable_entity
    else
      render json: {teacher: teacher}, status: :created
    end
  end

  private

  def teachers_params
    params.permit(:id, :name, :email)
  end
end
