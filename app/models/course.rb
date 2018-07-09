class Course < ApplicationRecord
  belongs_to :teacher
  has_many :student_courses

  validates_uniqueness_of :code
  validates_presence_of :teacher_id, :name, :code
end
