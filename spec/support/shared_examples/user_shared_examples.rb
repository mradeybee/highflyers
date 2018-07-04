RSpec.shared_examples "a user model" do
  context 'db' do
    context 'columns' do
      it { should have_db_column(:name).of_type(:string) }
      it { should have_db_column(:email).of_type(:string) }
      it { should have_db_column(:role).of_type(:integer) }
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:role) }
    it { should validate_uniqueness_of(:email) }
  end
end
