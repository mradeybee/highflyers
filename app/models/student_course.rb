class StudentCourse < ApplicationRecord
  belongs_to :student
  belongs_to :course
  belongs_to :teacher
  has_many :teacher_ratings, -> { uniq }, through: :teacher

  validates_presence_of :teacher_id, :course_id, :student_id
  validates :score, allow_blank: true, numericality: {
    less_than_or_equal_to: 100,
    only_integer: true
  }
end
