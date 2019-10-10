FactoryBot.define do
  factory :doctor do
    user_id { 1 }
    hospital_id { 1 }
    start_at { '08:00'.in_time_zone }
    end_at { '20:00'.in_time_zone }
  end
end