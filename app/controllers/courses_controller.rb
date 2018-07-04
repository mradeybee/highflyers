class CoursesController < ApplicationController
  def index
    courses = Course.all
    render json: {courses: courses}, status: :ok
  end

  def create
    course = Course.create(course_params)

    if course.errors.present?
      render json: {errors: course.errors.full_messages.join(', ')}, status: :unprocessable_entity
    else
      render json: {course: course}, status: :created
    end
  end

  private

  def course_params
    params.permit(:id, :name, :code, :teacher_id)
  end
end
