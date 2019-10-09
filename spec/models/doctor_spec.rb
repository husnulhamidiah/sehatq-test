require 'rails_helper'

RSpec.describe Doctor, type: :model do
    # Association test
    it { should have_many(:users).through(:appointments) }
    # Validation tests
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
end
