FactoryBot.define do
  factory :appointment do
    user_id { 1 }
    doctor_id { 1 }
    start_at { '10:00'.in_time_zone }
    end_at { '11:00'.in_time_zone }
  end
end