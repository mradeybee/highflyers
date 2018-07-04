class User < ApplicationRecord
  enum role: [:student, :teacher]

  VALID_EMAIL_REGEX = /\A[\w+\-.+]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_presence_of :name, :email, :role
  validates :role, inclusion: %w(student teacher)
  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
end
