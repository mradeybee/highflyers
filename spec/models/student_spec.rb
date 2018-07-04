require 'rails_helper'

RSpec.describe Student, type: :model do
  it_behaves_like 'a user model'
end
