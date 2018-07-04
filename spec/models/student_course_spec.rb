require 'rails_helper'

RSpec.describe StudentCourse, type: :model do
  context 'db' do
    context 'columns' do
      it { should have_db_column(:score).of_type(:integer) }
      it { should have_db_column(:course_id).of_type(:integer) }
      it { should have_db_column(:student_id).of_type(:integer) }
      it { should have_db_column(:teacher_id).of_type(:integer) }
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:score) }
    it { should validate_numericality_of(:score) }
    it { should validate_presence_of(:course_id) }
    it { should validate_presence_of(:teacher_id) }
    it { should validate_presence_of(:student_id) }
  end
end
