class CoursesController < ApplicationController
  def index
    render json: Course.all,
               each_serializer: CourseSerializer,
               status: :ok
  end

  def create
    course = Course.create(course_params)

    if course.errors.present?
      render(
        json: { errors: course.errors.full_messages.join(', ') },
        status: :unprocessable_entity
        )
      else
        render json: course, serializer: CourseSerializer, status: :created
    end
  end

  def register
    students_course = service.register_course(course_params[:id])

    if students_course.errors.present?
      render(
        json: { errors: students_course.errors.full_messages.join(', ') },
        status: :unprocessable_entity
      )
    else
      render json: students_course, serializer: StudentCoursesSerializer,  status: :created
    end
  end

  private

  def course_params
    params.permit(:id, :name, :code, :teacher_id, :student_id)
  end

  def service
    StudentService.new(course_params[:student_id])
  end
end
