class Teacher < ApplicationRecord
  has_many :teacher_ratings
  has_many :student_courses
  has_many :students, through: :student_courses
  has_many :courses

  VALID_EMAIL_REGEX = /\A[\w+\-.+]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_presence_of :name, :email
  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
end
