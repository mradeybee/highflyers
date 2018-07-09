class TeacherSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :created_at, :updated_at

  has_many :courses
  has_many :teacher_ratings
  attribute :average_rating
  attribute :students

  def average_rating
    object.teacher_ratings.average(:rating).to_f
  end

  def students
    object.students
  end
end
