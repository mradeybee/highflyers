class StudentCourse < ApplicationRecord
  belongs_to :student
  belongs_to :course
  belongs_to :teacher
  has_many :teacher_ratings, through: :teacher

  validates_presence_of :teacher_id, :course_id, :student_id, :score
  validates :score, numericality: { less_than_or_equal_to: 100,  only_integer: true }
end
