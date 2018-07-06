class Student < ApplicationRecord
  has_many :student_courses
  has_many :courses, through: :student_courses
  has_many :teachers, through: :student_courses

  VALID_EMAIL_REGEX = /\A[\w+\-.+]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_presence_of :name, :email
  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  def highflyer?
    student_courses.where('score >= ?', 80).detect do |course|
      course.teacher.teacher_ratings.average(:rating).to_f >= 1
    end.present?
  end
end
