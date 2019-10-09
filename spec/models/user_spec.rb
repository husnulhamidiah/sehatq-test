require 'rails_helper'

RSpec.describe User, type: :model do
  # Association test
  it { should have_many(:doctors).through(:appointments) }
  # Validation tests
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }
end
