class TeacherRating < ApplicationRecord
  belongs_to :student
  belongs_to :teacher

  validates_presence_of :teacher_id, :student_id, :rating
  validates :rating, numericality: true
  validate :check_for_duplicate
  validate :rating_is_in_range

  before_save :adjust_rating_for_highflyer

  private

  def adjust_rating_for_highflyer
    self.rating = rating * 2 if student.highflyer?
  end

  def rating_is_in_range
    if rating.to_i > 2 || rating.to_i < -2
      errors.add(:rating, "can't be greater that 2 and less that -2")
    end
  end

  def check_for_duplicate
    if TeacherRating.where(student: student, teacher: teacher).present?
      errors.add(:base, 'Rating exists')
    end
  end
end
