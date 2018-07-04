class Course < ApplicationRecord
  belongs_to :teacher

  validates_uniqueness_of :code
  validates_presence_of :teacher_id, :name, :code
end
