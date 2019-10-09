require 'rails_helper'

RSpec.describe Appointment, type: :model do
  # Association test
  it { should belong_to(:user) }
  it { should belong_to(:doctor) }
end
