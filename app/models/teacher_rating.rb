class TeacherRating < ApplicationRecord
  belongs_to :student
  belongs_to :teacher

  validates_presence_of :teacher_id, :student_id, :rating
  validates :rating, numericality: { less_than_or_equal_to: 5,  only_integer: true }
end
