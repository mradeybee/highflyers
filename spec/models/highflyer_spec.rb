require 'rails_helper'

RSpec.describe Highflyer, type: :model do
  it_behaves_like 'a user model'
  it { should_not define_enum_for(:role).with([:teacher]) }
end
