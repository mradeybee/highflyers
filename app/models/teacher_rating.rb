class TeacherRating < ApplicationRecord
  belongs_to :student
  belongs_to :teacher

  validates_presence_of :teacher_id, :student_id, :rating
  validates :rating, numericality: { greater_than_or_equal_to: -4, less_than_or_equal_to: 4, only_integer: true }
  before_save :validate_rating
  before_save :check_for_duplicate

  private

  def validate_rating
    high_flyer_student = student.highflyer?
    errors.add(:rating, "can't be greater that 2 and less that -2") if (rating > 2 || rating < -2) && !high_flyer_student
    self.rating = rating * 2 if high_flyer_student
  end

  def check_for_duplicate
    errors.add(:base, 'Rating exists') if TeacherRating.where(student: student, teacher: teacher).present?
  end
end
