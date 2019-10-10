FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    username { Faker::Alphanumeric.alpha(number: 10) }
    password { 'password' }
  end
end