require 'rails_helper'

RSpec.describe User, type: :model do
  it_behaves_like 'a user model'
  it { should define_enum_for(:role).with([:student, :teacher]) }
end
