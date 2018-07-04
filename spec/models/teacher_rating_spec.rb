require 'rails_helper'

RSpec.describe TeacherRating, type: :model do
  context 'db' do
    context 'columns' do
      it { should have_db_column(:rating).of_type(:integer) }
      it { should have_db_column(:student_id).of_type(:integer) }
      it { should have_db_column(:teacher_id).of_type(:integer) }
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:rating) }
    it { should validate_presence_of(:teacher_id) }
    it { should validate_presence_of(:student_id) }
    it { should validate_numericality_of(:rating) }
  end
end
