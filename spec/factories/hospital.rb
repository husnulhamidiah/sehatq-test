FactoryBot.define do
  factory :hospital do
    name { Faker::Nation.unique.capital_city }
  end
end