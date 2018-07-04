require 'rails_helper'

RSpec.describe Course, type: :model do
  context 'db' do
    context 'columns' do
      it { should have_db_column(:code).of_type(:string) }
      it { should have_db_column(:name).of_type(:string) }
      it { should have_db_column(:teacher_id).of_type(:integer) }
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:code) }
    it { should validate_presence_of(:teacher_id) }
  end
end
