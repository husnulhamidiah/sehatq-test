require 'rails_helper'

RSpec.describe Doctor, type: :model do
    it { should have_many(:users).through(:appointments) }

    it { should validate_uniqueness_of(:user_id) }
    
    it { should validate_presence_of(:start_at) }
    it { should validate_presence_of(:end_at) }
end
